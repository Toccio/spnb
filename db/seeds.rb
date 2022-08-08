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
      rating: rand(1..5),
      number: rand(1..1000),
      fnumber: rand(1..500)
    )
    # puts "Superpower #{superpower.id} created"
end
