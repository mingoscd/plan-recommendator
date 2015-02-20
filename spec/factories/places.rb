require 'faker'

FactoryGirl.define do
  factory :place do
    name { Faker::Company.name }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    price { Faker::Commerce.price }
    lat { Faker::Address.latitude }
    lon { Faker::Address.longitude }
    type_of_site { Faker::Commerce.department(1) }
  end
end
