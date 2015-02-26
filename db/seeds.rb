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
Category.create(name: "Beautiful Place")
Category.create(name: "Cafe")
Category.create(name: "Dancing")
Category.create(name: "Food/Restaurant")
Category.create(name: "Hotel")
Category.create(name: "Monument")
Category.create(name: "Museum")
Category.create(name: "Park")
Category.create(name: "Party")
Category.create(name: "Shopping")
Category.create(name: "Theater")
Category.create(name: "Zoo/Aquarium")
Category.create(name: "Other")

#generate currencies
Currency.destroy_all
Currency.create(name: "euro", symbol: "€")
Currency.create(name: "dollar", symbol: "$")
Currency.create(name: "pound", symbol: "£")

#generate base sites
Place.destroy_all
Place.create(city: "Barcelona", name: "Arc de trionf", type_of_site: "Monument" , address: "Passeig de Lluís Companys 15" , lat: 41.391052, lon: 2.180645 , price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Parc de la ciutadela", type_of_site: "Park", address: "Carrer de l'Institut Escola 16.I" , lat: 41.388123, lon: 2.186015, price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Barceloneta", type_of_site: "Beach" , address: "Passeig Marítim Barceloneta 8", lat: 41.3792154, lon: 2.1941389 , price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Granier", type_of_site: "Cafe" , address: "Carrer de Balmes, 25", lat: 41.3876749, lon: 2.1643342, price: 3, currency: "euro")
Place.create(city: "Barcelona", name: "Konig", type_of_site: "Food/Restaurant" , address: "Rambla de Catalunya, 5" , lat: 41.3875651, lon: 2.1681331, price: 10, currency: "euro")
Place.create(city: "Barcelona", name: "100 Montaditos", type_of_site: "Food/Restaurant" , address: "Rambla de Catalunya, 11" , lat: 41.3877654, lon: 2.1678642, price: 5, currency: "euro")
Place.create(city: "Barcelona", name: "MNAC", type_of_site: "Museum" , address: "Parc de Montjuïc, s/n", lat: 41.36844, lon: 2.15357, price:  8.50, currency: "euro")
Place.create(city: "Barcelona", name: "Plaza Catalunya", type_of_site: "Other" , address: "Plaça de Catalunya", lat: 41.3865302, lon: 2.1701819, price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Plaza Espanya", type_of_site: "Other", address: "Plaça de Espanya", lat: 41.3750703, lon: 2.1488254, price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Casa Batllo", type_of_site: "Monument", address: "Passeig de Gràcia, 43" , lat: 41.3916981, lon: 2.1647984, price: 21.5, currency: "euro")
Place.create(city: "Barcelona", name: "Sagrada Familia", type_of_site: "Monument" , address: "Carrer de Mallorca, 401", lat: 41.4027384, lon: 2.1749586, price: 15, currency: "euro")
Place.create(city: "Barcelona", name: "Teatro Coliseum", type_of_site: "Theater" , address: "Gran Via de les Corts Catalanes, 595", lat: 41.3878383, lon: 2.1663155, price: 25, currency: "euro")
Place.create(city: "Barcelona", name: "Mirador de Colon", type_of_site: "Monument" , address: "Plaza Portal de la Pau, s/n" , lat: 41.3734304, lon: 2.176566, price: 4.5, currency: "euro")
Place.create(city: "Barcelona", name: "Laberinto de Horta", type_of_site: "Park" , address: "Passeig dels Castanyers, 12" , lat: 41.438271, lon: 2.147841, price: 4.5, currency: "euro")