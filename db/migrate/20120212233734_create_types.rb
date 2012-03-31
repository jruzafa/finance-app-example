class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :types, :user_id
  end
end
