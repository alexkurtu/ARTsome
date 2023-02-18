# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "destroying existing data"

Art.destroy_all

puts "destroying all users"

User.destroy_all

puts "destroying all bookings"

Booking.destroy_all

puts "Creating user"

user = User.create!(email: "user@user.com", password: "123456")

puts "preparing to seed the database"

art = Art.new(
  category: Faker::Commerce.department,
  title: Faker::Commerce.product_name,
  description: Faker::Movies::StarWars.quote,
  picture: "https://images.unsplash.com/photo-1645680827507-9f392edae51c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80",
  artist: Faker::Artist.name,
  year: rand(1500..2023),
  current_location: "Berlin, Germany",
  price: rand(100..1000)
)
art.user = user
art.save!

art = Art.new(
  category: Faker::Commerce.department,
  title: Faker::Commerce.product_name,
  description: Faker::Movies::StarWars.quote,
  picture: "https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80",
  artist: Faker::Artist.name,
  year: rand(1500..2023),
  current_location: "Madrid, Spain",
  price: rand(100..1000)
)

art.user = user
art.save!

art = Art.new(
  category: Faker::Commerce.department,
  title: Faker::Commerce.product_name,
  description: Faker::Movies::StarWars.quote,
  picture: "https://images.unsplash.com/photo-1622737133809-d95047b9e673?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3732&q=80",
  artist: Faker::Artist.name,
  year: rand(1500..2023),
  current_location: "Amsterdam, Netherlands",
  price: rand(100..1000)
)

art.user = user
art.save!

art = Art.new(
  category: Faker::Commerce.department,
  title: Faker::Commerce.product_name,
  description: Faker::Movies::StarWars.quote,
  picture: "https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1372&q=80",
  artist: Faker::Artist.name,
  year: rand(1500..2023),
  current_location: "London, UK",
  price: rand(100..1000)
)

art.user = user
art.save!

art = Art.new(
  category: Faker::Commerce.department,
  title: Faker::Commerce.product_name,
  description: Faker::Movies::StarWars.quote,
  picture: "https://images.unsplash.com/photo-1549490349-8643362247b5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  artist: Faker::Artist.name,
  year: rand(1500..2023),
  current_location: "Berlin, Germany",
  price: rand(100..1000)
)

art.user = user
art.save!

art = Art.new(
  category: Faker::Commerce.department,
  title: Faker::Commerce.product_name,
  description: Faker::Movies::StarWars.quote,
  picture: "https://images.unsplash.com/photo-1579783902188-1dbf2b672dc8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=916&q=80",
  artist: Faker::Artist.name,
  year: rand(1500..2023),
  current_location: "Rome, Italy",
  price: rand(100..1000)
)
art.user = user
art.save!

art = Art.new(
  category: "Painting",
  title: "Monalisa",
  description: Faker::Movies::StarWars.quote,
  picture: "https://images.unsplash.com/photo-1423742774270-6884aac775fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80",
  artist: "Leonardo da Vinci",
  year: "1503",
  current_location: "Paris, France",
  price: rand(100_000..1_000_000_000)
)
art.user = user
art.save!

puts "created #{Art.count} arts"

puts "Creating booking"
r_user = User.all.sample
r_art = Art.all.sample

current = Booking.create!(offer_date: "11.02.2023", value: 350, rent_type: 1,
                          starts_at: "11.02.23", ends_at: "22.02.23",
                          shipping_address: "Berlin, Germany", user_id: r_user.id, art_id: r_art.id)

                          