require'faker'

puts 'Creating database'
Reservation.destroy_all
Superpower.destroy_all
User.destroy_all
puts 'Database created'

superhero_quotes = [
  "Only the weak succumb to brutality. - Superman",
  "There is a right and a wrong in this universe. And that distinction is not hard to make. - 'Superman'",
  "Violence doesn’t discriminate. It comes as cold and bracing as a winter breeze and it leaves you with a chill you can’t shake off. - 'Daredevil'",
  "The fate of your planet rests not in the hands of gods. It rests in the hands of mortals. - 'Thor'",
  "But everybody’s story begins 'once upon a time,' and it’s up to us to cherish the time we’re given to ensure we live happily ever after. - 'Scarlet Witch'",
  "Heroes are made by the path they choose, not the powers they are graced with. - 'Iron Man'",
  "The greatest power on Earth is the magnificent power we all of us possess... the power of the human brain! - 'Professor X'",
  "The strength of this country isn’t in buildings of brick and steel. It’s in the hearts of those who have sworn to fight for its freedom! - 'Captain America'",
  "You only have your thoughts and dreams ahead of you. You are someone. You mean something. - 'Batman'",
  "No man can win every battle, but no man should fall without a struggle. -'Spiderman'",
  "When you decide not to be afraid, you can find friends in super unexpected places. - 'Captain Marvel'",
  "It’s never as bad as it seems. You’re much stronger than you think you are. Trust me. - 'Superman'",
  "Life doesn’t give us purpose. We give life purpose. - 'The Flash'",
  "The future is worth it. All the pain. All the tears. The future is worth the fight. - 'Martian Manhunter'"
]

user_review = [
  "Useless power. The spider-web are not sticky enough and you cannot climb on the glass of modern buildings, the stickiness is not strong enough. Plus you are not allowed to slice people with this power, the owner is not insured.",
  "Great costume. All as described, I really liked the very tight costume.",
  "I had a great time using this super power. All the girls were chasing me! the only down side is that the costume provided by the owner was to small for me.",
  "I don't understand all the hype for this super power. Is nothing special, there are to many restrictions. The only good thing was that I had the chance to fight against Thanos, like iron-man, SPOILER ALERT but without dying."
]

superpower_description = [
  "strength and agility stand far above those of the average human, allowing you to lift nearly ten tons and to leap and move at incredible speeds with high accuracy.",
  "You can flight around and have superhuman strength, x-ray vision, heat vision, cold breath, super-speed, enhanced hearing, and nigh-invulnerability",
  "Superhuman strength and reflexes, enhanced senses and tracking abilities, and a special healing power that also slows your aging"
]

20.times do
  User.create!(
    first_name: Faker::Superhero.name,
    email: Faker::Internet.email,
    password:"123456")
end

50.times do
  Superpower.create!(
      user: User.first,
      name: Faker::Superhero.name,
      price: rand(25..1000),
      description: superpower_description.sample,
      address: Faker::Address.full_address,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      superpower_name: Faker::Superhero.power,
      rating: rand(1..5),
      number: rand(1..1000),
      fnumber: rand(1..500),
      avatar: Faker::Avatar.image,
      # CHANGE TO HOW_TO_USE?
      more_info: Faker::Lorem.sentence(word_count: 13, supplemental: true, random_words_to_add: 4),
      # CHANGE NAME IN REVIEW?
    )
end

20.times do
  Reservation.create!(user:User.all.sample, superpower:Superpower.all.sample)
  2.times do
    Review.create!(
      reservation:Reservation.all.sample,
      content: user_review.sample,
      rating: rand(1..5)
    )
  end
end
puts "Done 👌"
