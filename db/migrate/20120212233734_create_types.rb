class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :types, :user_id
  end
end
