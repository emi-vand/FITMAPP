# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gym1= Gym.create(name:'Third Space Tower Bridge', location:'2b More London Riverside, London SE1 2AP
', category:'General', user_id:4)
gym2= Gym.create(name:'Third Space Soho', location:'67 Brewer St, Soho, London W1F 9US', category:'General', user_id:4)
gym3= Gym.create(name: 'London Boxing Classes', location:'87-89 Shepperton Rd, Islington, London N1 3DF', user_id:5)
