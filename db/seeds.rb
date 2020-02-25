# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seed_user_a = User.create(email: "a@test.de", password: "testtest")
seed_user_b = User.create(email: "b@test.de", password: "testtest")

seed_venue = Venue.new(name: "Venue 1A", description: "Venue 1 description", category: "House", location: "Buenos Aires")
seed_venue.user = seed_user_a
seed_venue.save

seed_venue = Venue.new(name: "Venue 2A", description: "Venue 2 description", category: "House", location: "Buenos Aires")
seed_venue.user = seed_user_a
seed_venue.save

seed_venue = Venue.new(name: "Venue 3B", description: "Venue 3 description", category: "Dancehall", location: "New York")
seed_venue.user = seed_user_b
seed_venue.save

seed_venue = Venue.new(name: "Venue 4B", description: "Venue 4 description", category: "Dancehall", location: "New York")
seed_venue.user = seed_user_b
seed_venue.save
