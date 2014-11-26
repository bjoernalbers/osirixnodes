class CreateTransferSyntaxes < ActiveRecord::Migration
  def change
    create_table :transfer_syntaxes do |t|
      t.integer :value
      t.string :name

      t.timestamps
    end
  end
end
