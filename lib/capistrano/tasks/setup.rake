namespace :setup do
  desc 'Upload SSL certificate and private key.'
  task :ssl do
    on roles(:web) do
      %w(ssl_cert.crt ssl_private_key.key).each do |file|
        upload! StringIO.new(File.read(File.join('config', file))),
          File.join(shared_path, file)
      end
    end
  end
end
