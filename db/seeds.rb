# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seed_user = User.create(email: "test@test.com", password: "testest")

seed_venue = Venue.new(name: "Venue 1", description: "Venue 1 description", category: "House", location: "Buenos Aires")
seed_venue.user = seed_user
seed_venue.save
