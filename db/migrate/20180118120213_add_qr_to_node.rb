class AddQrToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :qr, :boolean, null: false, default: true
  end
end
