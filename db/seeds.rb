# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require'faker'

puts 'Creating database'
Reservation.destroy_all
Superpower.destroy_all
User.destroy_all
puts 'Database created'

User.create!(first_name:'luca',email:'lucafigo@gmail.com', password:"123456")
User.create!(first_name:'anas',email:'anasfigo@gmail.com', password:"123456")

50.times do
  Superpower.create!(
      user_id: User.first.id,
      name: Faker::Superhero.name,
      price: rand(25..1000),
      description: Faker::ChuckNorris.fact,
      address: Faker::Address.full_address,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      superpower_name: Faker::Superhero.power,
      rating: rand(1..5)
    )
    # puts "Superpower #{superpower.id} created"
end

# 50.times do
#   Superpower.create!(
#     name: Faker::Superhero.name
#   )
# end
