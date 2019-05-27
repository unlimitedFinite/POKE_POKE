# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Delete records
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
  password: 'password'
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


# Create Pokemons
Pokemon.create(
  user: ash,
  level: 25,
  address: '2358 Lombard Street, San Francisco, CA, USA',
  price_per_day: 50,
  name: 'Pikachu',
  category: 'electric'
)

Pokemon.create(
  user: ash,
  level: 25,
  address: 'Conkal, 97345 Conkal, Yucatan, Mexico',
  price_per_day: 50,
  name: 'Charmander',
  category: 'fire'
)

Pokemon.create(
  user: misty,
  level: 25,
  address: '98456 15th Avenue, Prince George, BC, Canada',
  price_per_day: 50,
  name: 'Bulbasaur',
  category: 'grass'
)

Pokemon.create(
  user: misty,
  level: 25,
  address: 'Vyshovatyi, Zakarpattia Oblast, Ukraine, 90546',
  price_per_day: 50,
  name: 'Squirtle',
  category: 'water'
)

