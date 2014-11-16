# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(email: 'hallo@osirixnodes.com',
                    password: 'Surfer"Dolls90',
                    api_key: 'example')
user.nodes.create!(name: 'OsiriXNodes.com',
                   host: '127.0.0.1',
                   port: 11112,
                   aetitle: 'OSIRIXNODES')

