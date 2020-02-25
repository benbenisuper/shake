# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

morgan = User.create(email: "morgan@shake.com", password: "testtest", first_name: "Morgan", last_name: "X", phone:"0000")
ben = User.create(email: "ben@shake.com", password: "testtest", first_name: "Ben", last_name: "X", phone:"0000")
jose = User.create(email: "jose@shake.com", password: "testtest", first_name: "Jose", last_name: "X", phone:"0000")
manuel = User.create(email: "manuel@shake.com", password: "testtest", first_name: "Manuel", last_name: "X", phone:"0000")


seed_venue = Venue.new(name: "Venue Jose A", description: "Venue 1 description", price: 100, activity: "Wedding", capacity: "10", category: "Private House", location: "Buenos Aires")
seed_venue.user = jose
seed_venue.save

seed_venue = Venue.new(name: "Venue Jose B", description: "Venue 2 description", price: 100, activity: "Wedding", capacity: "10", category: "Private House", location: "Buenos Aires")
seed_venue.user = jose
seed_venue.save



seed_venue = Venue.new(name: "Venue Morgan A", description: "Venue 3 description", price: 100, activity: "Wedding", capacity: "10", category: "Private House", location: "Buenos Aires")
seed_venue.user = morgan
seed_venue.save

seed_venue = Venue.new(name: "Venue Morgan B", description: "Venue 4 description", price: 100, activity: "Wedding", capacity: "10", category: "Private House", location: "Buenos Aires")
seed_venue.user = morgan
seed_venue.save



seed_venue = Venue.new(name: "Venue Ben A", description: "Venue 5 description", price: 100, activity: "Wedding", capacity: "10", category: "Private House", location: "Buenos Aires")
seed_venue.user = ben
seed_venue.save

seed_venue = Venue.new(name: "Venue Ben B", description: "Venue 6 description", price: 100, activity: "Wedding", capacity: "10", category: "Private House", location: "Buenos Aires")
seed_venue.user = ben
seed_venue.save



seed_venue = Venue.new(name: "Venue Manuel A", description: "Venue 7 description", price: 100, activity: "Wedding", capacity: "10", category: "Private House", location: "Buenos Aires")
seed_venue.user = manuel
seed_venue.save

seed_venue = Venue.new(name: "Venue Manuel B", description: "Venue 8 description", price: 100, activity: "Wedding", capacity: "10", category: "Private House", location: "Buenos Aires")
seed_venue.user = manuel
seed_venue.save
