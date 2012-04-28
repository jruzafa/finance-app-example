# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	
#home = Category.create(:name => 'Home', :user_id => user.id)
#work = Category.create(:name => 'Work', :user_id => user.id)
#Category.create(:name => 'Leisure', :user_id => user.id)
#Category.create(:name => 'Get away', :user_id => user.id)
# users

jhon 		= User.create(:email => 'jhon@example.com', :password => '654321')
michelle 	= User.create(:email => 'michelle@example.com', :password => '876543')

# categories_jhon = Category.create([{:name => 'Home'}, {:name => 'Work'}, {:name => 'Leisure'}])
# types_jhon = Type.create([{:name => 'Weekly'}, {:name => 'Monthly'}, {:name => 'Yearly'}, {:name => 'Once'}])

home_jhon = Category.create(:name => 'Home', :user => jhon)
work_jhon = Category.create(:name => 'Work', :user => jhon)

home_michelle = Category.create(:name => 'Home',:user => michelle)
work_michelle = Category.create(:name => 'Work',:user => michelle)

# categories_michelle = Category.create([{:name => 'Home'}, {:name => 'Work'}, {:name => 'Leisure'}])
# types_michelle = Type.create([{:name => 'Weekly'}, {:name => 'Monthly'}, {:name => 'Yearly'}, {:name => 'Once'}])

weekly_jhon = Type.create(:name => 'Weekly', :user => jhon)
once_jhon 	= Type.create(:name => 'Once', :user => jhon)

weekly_michelle = Type.create(:name => 'Weekly', :user => michelle)
once_michelle 	= Type.create(:name => 'Once', :user => michelle)

Entry.create(:concept => 'appointment work', :amount => '2000', :category =>  work_michelle, :user => michelle, :type_id => weekly_michelle)
Entry.create(:concept => 'Rent a room', :amount => '350', :category =>  home_michelle, :user => michelle, :type_id => once_michelle)
Entry.create(:concept => 'Sell tv for internet', :amount => '1000', :category => home_jhon, :user => jhon, :type_id => once_jhon)
Entry.create(:concept => 'appointment christmas', :amount => '3000', :category => work_jhon, :user => jhon, :type_id => weekly_jhon)
#Entry.create(:concept => 'Coffe with Michelle', :amount => '2.5' ,:category_id =>  home.id ,:user_id => user.id, :type_id => type_once.id)
#Entry.create(:concept => 'Insurance', :amount => '150,6' ,:category_id =>  home.id ,:user_id => user.id, :type_id => type_yearly.id)

Expense.create(:concept => 'Beer and friends of the office hello', :amount => '5.6', :category =>  work_michelle, :user => michelle, :type_id => weekly_michelle)
Expense.create(:concept => 'Living room TV', :amount => '700.3', :category =>  home_michelle, :user => michelle, :type_id => once_michelle)
Expense.create(:concept => 'Children beedroms', :amount => '1000', :category => home_jhon, :user => jhon, :type_id => once_jhon)
Expense.create(:concept => 'Desktop charger', :amount => '30.4', :category => work_jhon, :user => jhon, :type_id => weekly_jhon)