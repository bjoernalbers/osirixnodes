class DropUsers < ActiveRecord::Migration
  def up
    remove_column :nodes, :user_id
    drop_table :users
  end

  def down
    #raise on reverse
  end
end
