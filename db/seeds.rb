# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "Seeding Database"

puts "Seeding Users"
users = User.create!([{
  email: "emilia@gmail.com", password: "123456", first_name: "Emilia", last_name: "Vandamme", username: "emivand", dietary_requirements: "vegan"},
  {email: "matt@gmail.com", password: "123456", first_name: "Matt", last_name: "Hardy", username: "matthardy", dietary_requirements: "keto"},
  {email: "denisa@gmail.com", password: "123456", first_name: "Denisa", last_name: "Milian", username: "denisamil", dietary_requirements: "vegetarian"},
  {email: "bob@gmail.com", password: "123456", first_name: "Bob", last_name: "Bryan", username: "bob", owner: true},
  {email: "bruce@gmail.com", password: "123456", first_name: "Bruce", last_name: "Wyman", username: "bruce", owner: true}
])
puts "Done!"

puts "Seeding Gyms"
gyms = Gym.create!([{
  name:'Third Space Tower Bridge', location:'2b More London Riverside, London SE1 2AP', category:'General', user_id:4},
  {name:'Third Space Soho', location:'67 Brewer St, Soho, London W1F 9US', category:'General', user_id:4},
  {name: 'London Boxing Classes', location:'87-89 Shepperton Rd, Islington, London N1 3DF', category:'Boxing', user_id:5}
])
puts "Done!"

puts "Seeding Restaurants"
restaurants = Restaurant.create!([{
  name: "Hello Salad", location: "Shoreditch, London", category: "Salads", user_id: 4},
  {name: "Wagon Wok", location: "Hoxton, London", category: "Asian", user_id: 5},
  {name: "Sushi Samaba", location: "Liverpool Street, London", category: "Sushi", user_id: 5}])
  puts "Done!"

  puts "Seeding Dishes"
dishes = Dish.create!([{
  name: "Stir Fry Noodles", description: "Delicious egg noodles stir fried with your choice of chicken or vegetables", restaurant_id: 2},
  {name: "Teriyaki Salmon", description: "Juicy, flakey salmon with an absolutely delicious homemade teriyaki sauce", restaurant_id: 2},
  {name: "Steamed Dumplings", description: "Pockets of dough filled with seasoned meat and vegetables", restaurant_id: 2}
])
puts "Done!"

puts "Seeding Gym Classes"
classes = GymClass.create!([{
  name: "Boxercise", time: '12:30', gym_id: 1},
  {name: "Spin", time: '15:30', gym_id: 1},
  {name: "Hot Yoga", time: '19:00', gym_id: 1}
])
puts "Done!"
puts "Database seeded!"