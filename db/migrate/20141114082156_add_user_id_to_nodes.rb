class AddUserIdToNodes < ActiveRecord::Migration
  def up
    add_column :nodes, :user_id, :integer
    # Hack for SQLite: http://stackoverflow.com/questions/3170634/how-to-solve-cannot-add-a-not-null-column-with-default-value-null-in-sqlite3
    change_column :nodes, :user_id, :integer, null: false
  end

  def down
    remote_column :nodes, :user_id
  end
end
