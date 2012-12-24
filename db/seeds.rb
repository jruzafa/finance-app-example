# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# users
jhon 		= User.create(:email => 'jhon@example.com', :password => '654321')
michelle 	= User.create(:email => 'michelle@example.com', :password => '876543')

# categories
home_jhon = Category.create(:name => 'Home', :user => jhon)
work_jhon = Category.create(:name => 'Work', :user => jhon)

home_michelle = Category.create(:name => 'Home',:user => michelle)
work_michelle = Category.create(:name => 'Work',:user => michelle)

# entries
Entry.create(:concept => 'appointment work', :amount => '2000', :category =>  work_michelle, :user => michelle)
Entry.create(:concept => 'Rent a room', :amount => '350', :category =>  home_michelle, :user => michelle)
Entry.create(:concept => 'Sell tv for internet', :amount => '1000', :category => home_jhon, :user => jhon)
Entry.create(:concept => 'appointment christmas', :amount => '3000', :category => work_jhon, :user => jhon)

# expenses
Expense.create(:concept => 'Beer and friends of the office hello', :amount => '5.6', :category =>  work_michelle, :user => michelle)
Expense.create(:concept => 'Living room TV', :amount => '700.3', :category =>  home_michelle, :user => michelle)
Expense.create(:concept => 'Children beedroms', :amount => '1000', :category => home_jhon, :user => jhon)
Expense.create(:concept => 'Desktop charger', :amount => '30.4', :category => work_jhon, :user => jhon)