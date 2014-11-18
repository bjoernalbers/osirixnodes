namespace :setup do
  desc 'Setup fresh server (Upload secrets & SSL certificate)'
  task all: [:ssl, :yml]

  desc 'Upload SSL certificate & private key'
  task ssl: :dir do
    on roles(:web) do
      %w(config/ssl_cert.crt config/ssl_private_key.key).each do |file|
        path = shared_path + File.basename(file)
        upload! StringIO.new(File.read(file)), path
      end
    end
  end

  desc 'Upload database.yml & secrets.yml'
  task yml: :dir do
    on roles(:app) do
      %w(config/database.yml config/secrets.yml).each do |file|
        path = shared_path + file
        upload! StringIO.new(File.read(file)), path
      end
    end
  end

  desc 'Create config directory'
  task :dir do
    on roles(:app, :web) do
      execute "mkdir -p #{shared_path + 'config'}"
    end
  end
end
