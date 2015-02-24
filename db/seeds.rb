# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 5.times do |i|
# 	place = FactoryGirl.create(:place)
# end

#generate categories
Category.destroy_all
Category.create(name: "Bar")
Category.create(name: "Beach")
Category.create(name: "Dancing")
Category.create(name: "Hotel")
Category.create(name: "Monument")
Category.create(name: "Park")
Category.create(name: "Party")
Category.create(name: "Shopping")

#generate currencies
Currency.destroy_all
Currency.create(name: "euro", symbol: "€")
Currency.create(name: "dollar", symbol: "$")
Currency.create(name: "pound", symbol: "£")