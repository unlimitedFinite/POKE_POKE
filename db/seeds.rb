# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
# Delete records
Booking.destroy_all
Pokemon.destroy_all
User.destroy_all

# Create Users
ash = User.create(
  email: 'ash.ketchum@pokemon.com',
  first_name: 'Ash',
  last_name: 'Ketchum',
  dob: '1/1/1990',
  phone_number: '(123) 234-9823',
  gender: 'M',
  password: 'password',
  is_owner: true
)

misty = User.create(
  email: 'misty.star@pokemon.com',
  first_name: 'Misty',
  last_name: 'Star',
  dob: '1/1/1989',
  phone_number: '(123) 495-0239',
  gender: 'F',
  password: 'password'
)


names = []
url = 'https://pokeapi.co/api/v2/pokemon?limit=20'
json = open(url).read
data = JSON.parse(json)['results']
data.each do |result|
  names << result['name']
end

# Create Pokemons
count = 0
names.each do |name|
  url = "https://pokeapi.co/api/v2/pokemon/#{name}"
  json = open(url).read
  data = JSON.parse(json)
  pokemon = Pokemon.new(
    user: ash,
    level: rand(0..25),
    address: '2358 Lombard Street, San Francisco, CA, USA',
    price_per_day: rand(0..50),
    name: name,
    category: data['types'][0]['type']['name'],
    photo: data['sprites']['front_default']
  )
  count += 1
  pokemon.save
end


