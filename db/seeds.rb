# Example Node
if Node.count.zero?
  Node.create!(name:            'A boring example node',
               aetitle:         'OSIRIXNODES',
               address:         '127.0.0.1',
               port:            11112,
               transfer_syntax: 0)
end
