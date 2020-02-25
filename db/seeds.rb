# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

morgan = User.create(email: "morgan@shake.com", password: "testtest", first_name: "Morgan", last_name: "X", phone:"0000")
ben = User.create(email: "ben@shake.com", password: "testtest", first_name: "Ben", last_name: "X", phone:"0000")
jose = User.create(email: "jose@shake.com", password: "testtest", first_name: "Jose", last_name: "X", phone:"0000")
manuel = User.create(email: "manuel@shake.com", password: "testtest", first_name: "Manuel", last_name: "X", phone:"0000")




10.times do
seed_venue = Venue.new(name: Faker::Name.name , description: Faker::Lorem.paragraphs, price: Faker::Number.number(digits: 5), activity: "Wedding", capacity: Faker::Number.number(digits: 2), category: "Private House", location: Faker::Address.full_address)
seed_venue.user = jose
seed_venue.save
end

