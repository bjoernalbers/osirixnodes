# Example Node
node = Node.first_or_initialize
node.update!(name:    'A boring example node',
             aetitle: 'OSIRIXNODES',
             address: '127.0.0.1',
             port:    11112,
             transfer_syntax: 0)
