cookbook_path    ["cookbooks", "site-cookbooks"]
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
#encrypted_data_bag_secret "data_bag_key"

knife[:berkshelf_path] = "cookbooks"

# Fix SSL warning from chef
# (http://stackoverflow.com/questions/22991561/chef-solo-ssl-warning-when-provisioning)
ssl_verify_mode :verify_peer
