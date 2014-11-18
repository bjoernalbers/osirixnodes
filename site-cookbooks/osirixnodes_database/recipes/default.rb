#include_recipe 'build-essential'
include_recipe 'database::postgresql'

postgresql_connection_info = {
  host:     '127.0.0.1',
  password: node[:osirixnodes_database][:postgres_password]
}

db_and_user_name = 'osirixnodes_production'

postgresql_database node[:osirixnodes_database][:database] do
  connection postgresql_connection_info
  action :create
end

postgresql_database_user node[:osirixnodes_database][:username] do
  connection    postgresql_connection_info
  database_name node[:osirixnodes_database][:database]
  password      node[:osirixnodes_database][:password]
  action        :create
end
