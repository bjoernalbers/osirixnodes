class AddWadoHttpsToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :wado_https, :boolean, null: false, default: false
  end
end
