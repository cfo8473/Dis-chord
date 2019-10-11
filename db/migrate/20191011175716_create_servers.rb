class CreateServers < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.string :title, null: false
      t.integer :admin_id, null: false 

      t.timestamps
    end
    add_index :servers, :admin_id
  end
end
