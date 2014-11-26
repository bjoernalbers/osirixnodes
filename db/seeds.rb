# Transfer Syntaxes
{
  'Explicit Little Endian'           => 0,
  'Implicit Little Endian'           => 9,
  'JPEG 2000 Lossless'               => 1,
  'JPEG 2000 Lossy - High Quality'   => 2,
  'JPEG 2000 Lossy - Medium Quality' => 3,
  'JPEG 2000 Lossy - Low Quality'    => 4,
  'JPEG LS Lossless'                 => 13,
  'JPEG LS Lossy - High Quality'     => 15,
  'JPEG LS Lossy - Medium Quality'   => 16,
  'JPEG LS Lossy - Low Quality'      => 14,
  'JPEG Lossless'                    => 5
}.each do |name, value|
  TransferSyntax.find_or_initialize_by(value: value).update!(name: name)
end

# Example User
user = User.find_or_initialize_by(api_key: 'example')
user.update!(email:    'example@osirixnodes.com',
             password: Rails.application.secrets.example_user_password)
user.confirm!

# Example Node
explicit_little_endian = TransferSyntax.find_by!(value: 0)
node = user.nodes.first_or_initialize
node.update!(name:    'OsiriXNodes.com',
             aetitle: 'EXAMPLE',
             address: '127.0.0.1',
             port:    11112,
             transfer_syntax: explicit_little_endian)
