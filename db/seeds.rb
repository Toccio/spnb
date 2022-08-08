puts "cleaning up database"
# Superpower.destroy_all
puts "database clean"

puts 'creating superpower'
# authorize @superpower
  50.times do
   Superpower.create!(
    # user_id: Faker::IDNumber.valid,
      name: Faker::Superhero.name,
      # address: Faker::Address.street_address,
      # city: Faker::Address.city,
      # price: Faker::Number.decimal(l_digits: 3, r_digits: 3),
      # power: Faker::Superhero.power,
      # rating: rand(1..5)
      # description:
    )

    # puts "superpower #{superpower.id} created"
  end
puts 'Done'
