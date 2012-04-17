# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# password in plain is : 123456
user = User.create(:email => 'joe@example.com', :hashed_password => '7c4a8d09ca3762af61e59520943dc26494f8941b')

home = Category.create(:name => 'Home', :user_id => user.id)
work = Category.create(:name => 'Work', :user_id => user.id)
Category.create(:name => 'Leisure', :user_id => user.id)
Category.create(:name => 'Get away', :user_id => user.id)

type_weekly = Type.create(:name => 'Weekly', :user_id => user.id)
type_monthly = Type.create(:name => 'Monthly', :user_id => user.id)
type_yearly = Type.create(:name => 'Yearly', :user_id => user.id)
type_once = Type.create(:name => 'Once', :user_id => user.id)

Entry.create(:concept => 'Revision car', :amount => '150,6' ,:category_id =>  home.id ,:user_id => user.id, :type_id => type_once.id)
Entry.create(:concept => 'Children beedroms', :amount => '1000' ,:category_id =>  work.id ,:user_id => user.id, :type_id => type_once.id)
Entry.create(:concept => 'Coffe with Michelle', :amount => '2.5' ,:category_id =>  home.id ,:user_id => user.id, :type_id => type_once.id)
Entry.create(:concept => 'Insurance', :amount => '150,6' ,:category_id =>  home.id ,:user_id => user.id, :type_id => type_yearly.id)


