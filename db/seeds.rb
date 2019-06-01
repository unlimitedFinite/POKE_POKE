# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'faker'

puts 'Destroying db contents'
# Delete records
Review.destroy_all
Booking.destroy_all
Pokemon.destroy_all
User.destroy_all

puts 'Creating Ash'
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

puts 'Creating Misty'
misty = User.create(
  email: 'misty.star@pokemon.com',
  first_name: 'Misty',
  last_name: 'Star',
  dob: '1/1/1989',
  phone_number: '(123) 495-0239',
  gender: 'F',
  password: 'password',
  is_owner: true
)

puts 'Creating other Users'
5.times do
  User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    dob: '1/1/1990',
    phone_number: Faker::PhoneNumber.cell_phone,
    gender: 'M',
    password: 'password',
    is_owner: true
  )
end

5.times do
  User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    dob: '1/1/1990',
    phone_number: Faker::PhoneNumber.cell_phone,
    gender: 'F',
    password: 'password',
    is_owner: true
  )
end

puts 'Creating Pokemon'
names = []
url = 'https://pokeapi.co/api/v2/pokemon?limit=100'
json = open(url).read
data = JSON.parse(json)['results']
data.each do |result|
  names << result['name']
end

# Create Pokemons
count = 0
pokemon_list = []
names.each do |name|
  url = "https://pokeapi.co/api/v2/pokemon/#{name}"
  json = open(url).read
  data = JSON.parse(json)
  pokemon = Pokemon.new(
    user: User.order('RANDOM()').first,
    level: rand(0..25),
    address: Faker::Address.city,
    price_per_day: rand(0..50),
    name: name,
    category: data['types'][0]['type']['name'],
    photo: data['sprites']['front_default']
  )
  count += 1
  pokemon.save
  pokemon_list << pokemon
end

# Create Bookings
bookings_list = []
puts 'Creating active bookings'
# active bookings
pokemon_list.each do |pokemon|
  Booking.create(
    pokemon: pokemon,
    user: User.order('RANDOM()').first,
    start_dt: Faker::Date.between(10.days.ago, Date.today),
    end_dt: Faker::Date.between(Date.today, 10.days.from_now),
    price_paid: (Faker::Date.between(Date.today, 10.days.from_now) - Faker::Date.between(10.days.ago, Date.today)) * pokemon.price_per_day
  )
end

puts 'Creating past bookings'
# past bookings
pokemon_list.each do |pokemon|
  bookings_list << Booking.create(
    pokemon: pokemon,
    user: User.order('RANDOM()').first,
    start_dt: Faker::Date.between(60.days.ago, Date.new(2019, 4, 30)),
    end_dt: Date.new(2019, 4, 30),
    price_paid: (Date.new(2019, 4, 30) - Faker::Date.between(60.days.ago, Date.new(2019, 4, 30))) * pokemon.price_per_day
  )
end

puts 'Creating future bookings'
# future bookings
pokemon_list.each do |pokemon|
  Booking.create(
    pokemon: pokemon,
    user: User.order('RANDOM()').first,
    start_dt: Date.new(2019, 7, 30),
    end_dt: Faker::Date.between(Date.new(2019, 7, 30), 90.days.from_now),
    price_paid: (Faker::Date.between(Date.new(2019, 7, 30), 90.days.from_now) - Date.new(2019, 7, 30)) * pokemon.price_per_day
  )
end

# Creating reviews
bookings_list[0..10].each do |booking|
  Review.create(
    booking: booking,
    content: "#{booking.pokemon.name} was a #{Faker::Dessert.variety}",
    rating: rand(0..5)
  )
end
