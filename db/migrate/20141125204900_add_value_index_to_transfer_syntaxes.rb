class AddValueIndexToTransferSyntaxes < ActiveRecord::Migration
  def change
    add_index :transfer_syntaxes, :value, unique: true
  end
end
