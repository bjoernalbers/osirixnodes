class RenameHostOnNodes < ActiveRecord::Migration
  def change
    rename_column :nodes, :host, :address
  end
end
