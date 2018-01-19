class AddWadoUrlToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :wado_url, :string, default: 'wado'
  end
end
