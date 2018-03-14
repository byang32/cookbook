# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
# Categories
Category.create name: 'Beverages'
Category.create name: 'Deserts'
Category.create name: 'Appetizers'
Category.create name: 'Entrees'
Category.create name: 'Breakfast'
Category.create name: 'Sandwiches'

puts 'Created categories.'

User.create :username => "admin", :password => "password", :password_confirmation => "password"