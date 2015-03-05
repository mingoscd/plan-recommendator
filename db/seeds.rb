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
Category.create(name: "Cafe")
Category.create(name: "Disco")
Category.create(name: "Food_Restaurant")
Category.create(name: "Hotel")
Category.create(name: "Monument")
Category.create(name: "Museum")
Category.create(name: "Park")
Category.create(name: "Party")
Category.create(name: "Shopping")
Category.create(name: "Theater")
Category.create(name: "Zoo_Aquarium")
Category.create(name: "Other")

#generate currencies
Currency.destroy_all
Currency.create(name: "euro", symbol: "€")
Currency.create(name: "dollar", symbol: "$")
Currency.create(name: "pound", symbol: "£")

#generate base sites
Place.destroy_all
Place.create(city: "Barcelona", name: "Arc de trionf", type_of_site: "Monument" , address: "Passeig de Lluís Companys 15" , lat: 41.391052, lon: 2.180645 , price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Torre Agbar", type_of_site: "Monument" , address: "Avinguda Diagonal, 211" , lat: 41.403506, lon: 2.189577, price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Parc de la ciutadela", type_of_site: "Park", address: "Carrer de l'Institut Escola 16.I" , lat: 41.388123, lon: 2.186015, price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Parc Joan Miró", type_of_site: "Park", address: "" , lat: 41.378071, lon: 2.148418, price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Parc Carles I", type_of_site: "Park", address: "" , lat: 41.388544, lon: 2.193487, price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Parc de l'Oreneta", type_of_site: "Park", address: "" , lat: 41.399601, lon: 2.110911, price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Barceloneta", type_of_site: "Beach" , address: "Passeig Marítim Barceloneta 8", lat: 41.3792154, lon: 2.1941389 , price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Granier", type_of_site: "Cafe" , address: "Carrer de Balmes, 25", lat: 41.388040, lon: 2.164174, price: 3, currency: "euro")
Place.create(city: "Barcelona", name: "Konig", type_of_site: "Food_Restaurant" , address: "Rambla de Catalunya, 5" , lat: 41.3875651, lon: 2.1681331, price: 10, currency: "euro")
Place.create(city: "Barcelona", name: "100 Montaditos", type_of_site: "Food_Restaurant" , address: "Rambla de Catalunya, 11" , lat: 41.3877654, lon: 2.1678642, price: 5, currency: "euro")
Place.create(city: "Barcelona", name: "L'Ovella Negra", type_of_site: "Bar" , address: "Carrer Zamora, 78" , lat: 41.395879, lon: 2.190205, price: 5, currency: "euro")
Place.create(city: "Barcelona", name: "MNAC", type_of_site: "Museum" , address: "Parc de Montjuïc, s/n", lat: 41.368640, lon: 2.153541, price:  12, currency: "euro")
Place.create(city: "Barcelona", name: "CaixaForum", type_of_site: "Museum" , address: "", lat: 41.371446, lon: 2.149360, price:  10, currency: "euro")
Place.create(city: "Barcelona", name: "CosmoCaixa", type_of_site: "Museum" , address: "", lat: 41.413240, lon: 2.131563, price:  6, currency: "euro")
Place.create(city: "Barcelona", name: "Plaza Catalunya", type_of_site: "Other" , address: "Plaça de Catalunya", lat: 41.387031, lon: 2.170046, price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Plaza Espanya", type_of_site: "Other", address: "Plaça de Espanya", lat: 41.375043, lon: 2.149104, price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Casa Batllo", type_of_site: "Monument", address: "Passeig de Gràcia, 43" , lat: 41.3916981, lon: 2.1647984, price: 21.5, currency: "euro")
Place.create(city: "Barcelona", name: "Casa Ametller", type_of_site: "Monument", address: "Passeig de Gràcia, 41" , lat: 41.391570, lon: 2.165100, price: 15, currency: "euro")
Place.create(city: "Barcelona", name: "Casa Lleó i Morena", type_of_site: "Monument", address: "Passeig de Gràcia, 35" , lat: 41.391224, lon: 2.165512, price: 15, currency: "euro")
Place.create(city: "Barcelona", name: "La Pedrera", type_of_site: "Monument", address: "Carrer Provença, 261-265" , lat: 41.395435, lon: 2.161950, price: 30, currency: "euro")
Place.create(city: "Barcelona", name: "Sagrada Familia", type_of_site: "Monument" , address: "Carrer de Mallorca, 401", lat: 41.40363, lon: 2.174356, price: 15, currency: "euro")
Place.create(city: "Barcelona", name: "Teatro Coliseum", type_of_site: "Theater" , address: "Gran Via de les Corts Catalanes, 595", lat: 41.388139, lon: 2.166123, price: 25, currency: "euro")
Place.create(city: "Barcelona", name: "Teatro Liceu", type_of_site: "Theater" , address: "Les Rambles, 61", lat: 41.380323, lon: 2.173831, price: 25, currency: "euro")
Place.create(city: "Barcelona", name: "Mirador de Colon", type_of_site: "Monument" , address: "Plaza Portal de la Pau, s/n" , lat: 41.3757739, lon: 2.1777996, price: 4.5, currency: "euro")
Place.create(city: "Barcelona", name: "Laberinto de Horta", type_of_site: "Park" , address: "Passeig dels Castanyers, 12" , lat: 41.438271, lon: 2.147841, price: 4.5, currency: "euro")
Place.create(city: "Barcelona", name: "Zoo", type_of_site: "Zoo_Aquarium" , address: "" , lat: 41.387923, lon: 2.191247, price: 17.9, currency: "euro")
Place.create(city: "Barcelona", name: "Font Mágica de Montjuic", type_of_site: "Monument" , address: "" , lat: 41.371293, lon: 2.151710, price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Poble Espanyol", type_of_site: "Monument" , address: "" , lat: 41.368804, lon: 2.148225, price: 16.5, currency: "euro")
Place.create(city: "Barcelona", name: "Estadi Olimpic", type_of_site: "Other" , address: "" , lat: 41.364964, lon: 2.155698, price: 16.5, currency: "euro")
Place.create(city: "Barcelona", name: "Monasterio de Pedralbes", type_of_site: "Other" , address: "" , lat: 41.396075, lon: 2.112073, price: 4.4, currency: "euro")
Place.create(city: "Barcelona", name: "Mercat de la Boqueria", type_of_site: "Other" , address: "Les Rambles, 89" , lat: 41.382029, lon: 2.172286, price: 0, currency: "euro")
Place.create(city: "Barcelona", name: "Catedral de Barcelona", type_of_site: "Monument" , address: "" , lat: 41.384348, lon: 2.176061, price: 7, currency: "euro")
Place.create(city: "Barcelona", name: "Firefly", type_of_site: "Bar" , address: "Carrer de Bailèn, 41" , lat: 41.393614, lon: 2.174767, price: 4, currency: "euro")
Place.create(city: "Barcelona", name: "MOB", type_of_site: "Cafe" , address: "Carrer de Bailèn, 11" , lat: 41.391842, lon: 2.177192, price: 3, currency: "euro")
Place.create(city: "Barcelona", name: "La Taberna de l'Eixample", type_of_site: "Bar" , address: "Gran Via de les Corts Catalanes, 688" , lat: 41.393122, lon: 2.173748, price: 3, currency: "euro")
Place.create(city: "Barcelona", name: "Snooker", type_of_site: "Bar" , address: "Carrer de Roger de Llúria, 57", lat: 41.393700, lon: 2.167985, price: 5, currency: "euro")
Place.create(city: "Barcelona", name: "Santa Piadina", type_of_site: "Food_Restaurant" , address: "" , lat: 41.389278, lon: 2.179033, price: 5, currency: "euro")

User.create(email: "dcividanes91@gmail.com", password: "12345678", password_confirmation: "12345678")
User.create(email: "demo@planify.com", password: "hackshow", password_confirmation: "hackshow")