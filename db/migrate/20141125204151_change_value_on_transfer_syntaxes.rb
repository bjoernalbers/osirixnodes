class ChangeValueOnTransferSyntaxes < ActiveRecord::Migration
  def change
    change_column :transfer_syntaxes, :value, :integer, null: false
  end
end
