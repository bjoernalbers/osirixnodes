class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :name
      t.string :host
      t.integer :port
      t.string :aetitle

      t.timestamps
    end
  end
end
