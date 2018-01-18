class AddWadoTransferSyntaxToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :wado_transfer_syntax, :integer, null: false, default: -1
  end
end
