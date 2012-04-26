class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :concept
      t.float :amount
      t.references :category
      t.references :user
      t.references :type

      t.timestamps
    end
    add_index :expenses, :category_id
    add_index :expenses, :user_id
    add_index :expenses, :type_id
  end
end
