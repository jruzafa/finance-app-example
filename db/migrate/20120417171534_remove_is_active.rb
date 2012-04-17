class RemoveIsActive < ActiveRecord::Migration
  def up
  	remove_column :users, :is_active
  end

  def down
  	add_column :users, :is_active
  end
end
