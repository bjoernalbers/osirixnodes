desc 'Install chef on the server'
task :prepare do
  sh 'bundle exec knife solo prepare root@osirixnodes.com'
end

desc 'Provision the server'
task :cook do
  sh 'bundle exec knife solo cook root@osirixnodes.com'
end
