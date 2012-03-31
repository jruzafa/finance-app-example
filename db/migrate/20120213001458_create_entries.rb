class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :concept
      t.float :amount
      t.integer :category_id
      t.integer :user_id
      t.integer :type_id

      t.timestamps
    end
    add_index :entries, :category_id
    add_index :entries, :user_id
    add_index :entries, :type_id
  end
end
