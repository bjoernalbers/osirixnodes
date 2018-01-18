class AddWadoPortToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :wado_port, :integer, default: 8080
  end
end
