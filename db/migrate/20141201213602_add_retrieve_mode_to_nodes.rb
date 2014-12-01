class AddRetrieveModeToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :retrieve_mode, :integer, null: false, default: 0
  end
end
