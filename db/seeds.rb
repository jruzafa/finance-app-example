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

categories_jhon = Category.create([{:name => 'Home'}, {:name => 'Work'}, {:name => 'Leisure'}])
types_jhon = Type.create([{:name => 'Weekly'}, {:name => 'Monthly'}, {:name => 'Yearly'}, {:name => 'Once'}])

categories_michelle = Category.create([{:name => 'Home'}, {:name => 'Work'}, {:name => 'Leisure'}])
types_michelle = Type.create([{:name => 'Weekly'}, {:name => 'Monthly'}, {:name => 'Yearly'}, {:name => 'Once'}])

# users
jhon = User.create(:email => 'jhon@example.com', :password => '654321', :categories => categories_jhon, :types => types_jhon)
michelle = User.create(:email => 'michelle@example.com', :password => '876543', :categories => categories_michelle, :types => types_michelle)



#Entry.create(:concept => 'Revision car', :amount => '150.6' ,:category_id =>  home.id ,:user_id => user.id, :type_id => type_once.id)
#Entry.create(:concept => 'Children beedroms', :amount => '1000' ,:category_id =>  work.id ,:user_id => user.id, :type_id => type_once.id)
#Entry.create(:concept => 'Coffe with Michelle', :amount => '2.5' ,:category_id =>  home.id ,:user_id => user.id, :type_id => type_once.id)
#Entry.create(:concept => 'Insurance', :amount => '150,6' ,:category_id =>  home.id ,:user_id => user.id, :type_id => type_yearly.id)