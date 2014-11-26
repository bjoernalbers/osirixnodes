class AddTransferSyntaxIdToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :transfer_syntax_id, :integer
  end
end
