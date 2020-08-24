# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    users = User.create([{email: "emilia@gmail.com", password: "123456", first_name: "Emilia", last_name: "Vandamme", username: "emivand", dietary_requirements: "vegan"},
      {email: "matt@gmail.com", password: "123456", first_name: "Matt", last_name: "Hardy", username: "matthardy", dietary_requirements: "keto"},
      {email: "denisa@gmail.com", password: "123456", first_name: "Denisa", last_name: "Milian", username: "denisamil", dietary_requirements: "vegetarian"},
      {email: "bob@gmail.com", password: "123456", first_name: "Bob", last_name: "Bryan", username: "bob", owner: true},
      {email: "bruce@gmail.com", password: "123456", first_name: "Bruce", last_name: "Wyman", username: "bruce", owner: true}])
