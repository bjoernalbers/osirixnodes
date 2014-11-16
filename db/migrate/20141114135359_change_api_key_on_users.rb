class ChangeApiKeyOnUsers < ActiveRecord::Migration
  def up
    change_column :users, :api_key, :string, null: false
  end

  def down
    change_column :users, :api_key, :string, null: true
  end
end
