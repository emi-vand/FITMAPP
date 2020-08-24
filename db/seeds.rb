# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating restaurants"

hellosalad = Restaurant.create!(
  name: "Hello Salad",
  location: "Shoreditch, London",
  category: "Salads",
  user_id: 4
)

wagonwok = Restaurant.create!(
  name: "Wagon Wok",
  location: "Hoxton, London",
  category: "Asian",
  user_id: 5
)

sushisamaba = Restaurant.create!(
  name: "Sushi Samaba",
  location: "Liverpool Street, London",
  category: "Sushi",
  user_id: 5
)

puts "finished"
