# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying restaurants"
Restaurant.destroy_all
puts "Destroyed!"

puts "Creating 5 restaurants"
5.times do
  restaurant = Restaurant.create( # create instead of new since create does save
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: Restaurant::CATEGORIES.sample, # This one is not from Faker as I have an array validation
    phone_number: Faker::PhoneNumber.cell_phone
  )
  puts "#{restaurant.name} created."
end
puts "Done!"
