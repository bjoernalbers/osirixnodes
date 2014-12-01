class AddTransferSyntaxToNodes < ActiveRecord::Migration
  class Node < ActiveRecord::Base
  end

  class TransferSyntax < ActiveRecord::Base
  end

  def up
    add_column :nodes, :transfer_syntax, :integer, null: false, default: 0

    Node.reset_column_information
    TransferSyntax.reset_column_information

    Node.all.each do |node|
      transfer_syntax = TransferSyntax.find(node.transfer_syntax_id).value
      node.update!(transfer_syntax: transfer_syntax)
    end
  end

  def down
    remove_column :nodes, :transfer_syntax
  end
end
