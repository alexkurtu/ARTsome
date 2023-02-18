# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "destroying all pictures of arts on cloudinary"

Art.all.each do | art |
  art.photo.purge
end

puts "destroying all bookings"

Booking.destroy_all

puts "destroying all reviews"
Review.destroy_all

puts "destroying all arts"

Art.destroy_all

puts "destroying all users"

User.destroy_all


puts "Creating user"

user = User.create!(email: "user@user.com", password: "123456")

puts "preparing to seed the database"

21.times do
  art = Art.new(
    category: [ 'Watercolor Art', 'Oil Paintings', 'Acrylic Paintings', 'Photography', 'Digital Art', 'Street Art', 'Sculpture', 'Mosaic Art', 'Collage Art', 'Mixed Media Art' ].sample,
    title: Faker::Commerce.product_name,
    description: Faker::Movies::StarWars.quote,
    artist: Faker::Artist.name,
    year: rand(1500..2023),
    current_location: "#{Faker::Address.city}, #{Faker::Address.country}",
    price: rand(100..1000)
  )
  file = URI.open("https://source.unsplash.com/random?art")
  art.photo.attach(io: file, filename: art.title, content_type: "image/jpg")
  art.user = user
  art.save!
end



puts "created #{Art.count} arts"

puts "Creating booking"
r_user = User.all.sample
r_art = Art.all.sample

current = Booking.create!(value: 350, rent_type: 1,
                          starts_at: "11.02.23", ends_at: "22.02.23",
                          shipping_address: "Berlin, Germany", user_id: r_user.id, art_id: r_art.id)
