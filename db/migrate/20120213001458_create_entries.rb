class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :concept
      t.float :amount
      t.references :category
      t.references :user
      t.references :type

      t.timestamps
    end
    add_index :entries, :category_id
    add_index :entries, :user_id
    add_index :entries, :type_id
  end
end
