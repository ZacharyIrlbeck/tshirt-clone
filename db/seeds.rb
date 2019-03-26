# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Destroying ..."

Item.destroy_all
Rental.destroy_all
Tshirt.destroy_all
# User.destroy_all

new_admin_user = User.create!(email: 'admin@gmail.com', password: 'fuckyou', admin: true)

puts "Seeding ..."
10.times do
  new_user = User.new(email: Faker::Internet.email, password: 'fuckyou', first_name: Faker::Name.name, last_name: Faker::Name.name, admin: false)
  new_user.save!
  # first attempt cloudinary seed
  # resource_type = "image"
  # type = "upload"
  # public_id = ENV['CLOUDINARY_API_PUBLIC']
  # format = 'jpg'
  # version = 1234567890
  # signature = Cloudinary::Utils.api_sign_request({public_id: public_id, version: version}, Cloudinary.config_api_secret)
  # photo = "#{resource_type}/#{type}/v#{version}/#{public_id}.#{format}##{signature}"
  # end of attempt
  new_shirt = Tshirt.new(remote_photo_url: (Faker::Avatar.image), name: Faker::TvShows::RickAndMorty.character , description: Faker::TvShows::RickAndMorty.location, price: 10.00)
  puts new_shirt.photo
  new_shirt.user = new_user

  new_shirt.save!(validate: false)
  puts new_shirt.photo
end

if Tshirt.first
  puts "Finished ..."
else
  puts "Error ..."
end
