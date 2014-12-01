class RemoveTransferSyntaxes < ActiveRecord::Migration
  def up
    drop_table :transfer_syntaxes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
