# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating user"

user = User.create!(email: "user@example.com", password: "123456")

puts "destroying existing data"

Art.destroy_all

puts "preparing to seed the database"

art = Art.new(
  category: Faker::Commerce.department,
  title: Faker::Commerce.product_name,
  description: Faker::Movies::StarWars.quote,
  picture: "https://images.unsplash.com/photo-1645680827507-9f392edae51c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80",
  artist: Faker::Artist.name,
  year: rand(1500..2023),
  current_location: "Berlin, Germany"
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
  current_location: "Madrid, Spain"
)

art.user = user
art.save!

art = Art.new(
  user_id: 1,
  category: Faker::Commerce.department,
  title: Faker::Commerce.product_name,
  description: Faker::Movies::StarWars.quote,
  picture: "https://images.unsplash.com/photo-1536924940846-227afb31e2a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1466&q=80",
  artist: Faker::Artist.name,
  year: rand(1500..2023),
  current_location: "Amsterdam, Netherlands"
)

art.user = user
art.save!

art = Art.new(
  user_id: 1,
  category: Faker::Commerce.department,
  title: Faker::Commerce.product_name,
  description: Faker::Movies::StarWars.quote,
  picture: "https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1372&q=80",
  artist: Faker::Artist.name,
  year: rand(1500..2023),
  current_location: "London, UK"
)

art.user = user
art.save!

art = Art.new(
  user_id: 1,
  category: Faker::Commerce.department,
  title: Faker::Commerce.product_name,
  description: Faker::Movies::StarWars.quote,
  picture: "https://images.unsplash.com/photo-1549490349-8643362247b5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  artist: Faker::Artist.name,
  year: rand(1500..2023),
  current_location: "Berlin, Germany"
)

art.user = user
art.save!

puts "created #{Art.count} arts"
