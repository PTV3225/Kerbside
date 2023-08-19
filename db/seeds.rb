# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "pry-byebug"

puts "clearing database"

User.destroy_all
Treasure.destroy_all
TreasureType.destroy_all
Post.destroy_all
Chatroom.destroy_all

# Seed data for Users
puts "creating users"

40.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

puts "users created"


puts "creating admin user"

# Seed data for Admin User
admin_user = User.create!(
  email: 'admin@example.com',
  password: 'adminpassword',
  first_name: 'Admin',
  last_name: 'User'
)
puts "admin created"



#LOOOOOP throough it

puts "creating videos"

video_data = [
  { title: 'DIY Chair Restoration', description: Faker::Hobby.activity, url: 'https://youtu.be/Ek-EE37rPUQ' },
  { title: 'Fixing a Broken TV', description: Faker::Hobby.activity, url: 'https://youtu.be/hJGmrQDbUOQ' },
  { title: 'Upcycling Old Sofas', description: Faker::Hobby.activity, url: 'https://youtu.be/BrjN4vmwbuw' },
  { title: 'Most common fix of washing machine', description: Faker::Hobby.activity, url: 'https://youtu.be/KmPlBZ5nT1Q' }
]

videos = []

video_data.each do |data|
  videos << Video.create!(data)
end

puts "Videos created"

puts "creating Treasure Type with attached videos"

treasure_type_data = [
  { category: 'Chair', video_id: videos[0].id },
  { category: 'TV', video_id: videos[1].id },
  { category: 'Sofa', video_id: videos[2].id },
  { category: 'Washing machine', video_id: videos[3].id }
]

treasure_types = []

treasure_type_data.each do |data|
  treasure_types << TreasureType.create(data)
end

puts "Treasure Type and attached videos created"

# Seed data for Posts (addresses for location)

puts "creating posts and attaching photos"


first_six_user_ids = User.limit(15).pluck(:id)

posts_data = [
  { user_id: first_six_user_ids[0], location: '789 Elm St Maribyrnong', description: 'Sturdy chair ready for pickup on Elm St', council_pickup_date: '2023-09-10' },
  { user_id: first_six_user_ids[1], location: '123 Smith St Toorak', description: 'Great TV in working order at Smith St', council_pickup_date: '2023-09-12' },
  { user_id: first_six_user_ids[2], location: '456 Locke St East Malvern', description: 'Comfy reclining sofa available on Locke St', council_pickup_date: '2023-09-15' },
  { user_id: first_six_user_ids[3], location: '101 Maple Ave Dandenong', description: 'Washing machine stand up for grabs on Maple Ave', council_pickup_date: '2023-09-17' },
  { user_id: first_six_user_ids[4], location: '111 Pine St St Albans', description:'Almost brand new table looking for a new home on Pine St', council_pickup_date: '2023-09-19' },
  { user_id: first_six_user_ids[5], location: '222 Oak St St Kilda', description: 'Beautiful painting that will brighten up any room on Oak St', council_pickup_date: '2023-09-21' },
  { user_id: first_six_user_ids[6], location: '5 Davison Place South Yarra', description: 'Closet in great condition in South Yarra', council_pickup_date: '2023-09-23' },
  { user_id: first_six_user_ids[7], location: '9/315 Flemington Rd North Melbourne', description: 'Commuting bicycle with good seat but with a bit of rust on chain on Flemington Rd', council_pickup_date: '2023-09-23' }
]

post_photo_urls = [
  "https://images.unsplash.com/photo-1506898667547-42e22a46e125?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fGNoYWlyfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://plus.unsplash.com/premium_photo-1661497658228-cd6f13a4d39c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQ4fHxtb2Rlcm4lMjB0dnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://plus.unsplash.com/premium_photo-1673548917423-073963e7afc9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGZ1cm5pdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1626806787426-5910811b6325?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHdhc2hpbmclMjBtYWNoaW5lfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1533090481720-856c6e3c1fdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHRhYmxlfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1674503718104-950f67b26f9a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQ3fHxwYWludGluZ3MlMjBsaXZpbmclMjByb29tfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1558997519-83ea9252edf8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNsb3NldHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1618762044398-ec1e7e048bbd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGJpY3ljbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60"
]

posts_data.each_with_index do |post_data, index|
  post = Post.create!(post_data)
  file = URI.open(post_photo_urls[index])
  post.photos.attach(io: file, filename: "photo_#{index}.png", content_type: "image/png")
end
puts "Posts created"

puts "creating Treasures and attaching photos"
# Seed data for Treasures
treasures_data = [
  { treasure_type_id: TreasureType.first.id, status: true, post_id: Post.first.id, description: 'High-quality chair' },
  { treasure_type_id: TreasureType.second.id, status: true, post_id: Post.second.id, description: 'Fully functional TV' },
  { treasure_type_id: TreasureType.third.id, status: true, post_id: Post.third.id, description: 'Washing machine in good condition' }
]

treasure_photo_urls = [
  "https://images.unsplash.com/photo-1506898667547-42e22a46e125?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fGNoYWlyfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://plus.unsplash.com/premium_photo-1661497658228-cd6f13a4d39c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQ4fHxtb2Rlcm4lMjB0dnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://plus.unsplash.com/premium_photo-1673548917423-073963e7afc9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGZ1cm5pdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1626806787426-5910811b6325?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHdhc2hpbmclMjBtYWNoaW5lfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1533090481720-856c6e3c1fdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHRhYmxlfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1674503718104-950f67b26f9a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQ3fHxwYWludGluZ3MlMjBsaXZpbmclMjByb29tfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1558997519-83ea9252edf8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNsb3NldHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1618762044398-ec1e7e048bbd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGJpY3ljbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60"
]

treasures_data.each_with_index do |treasure_data, index|
  treasure = Treasure.create!(treasure_data)
  file = URI.open(treasure_photo_urls[index])
 treasure.photo.attach(io: file, filename: "photo_#{index}.png", content_type: "image/png")
end
puts "Treasures created"
# Seed data for Chatrooms

chatroom_names = [
  'Television on Smith St',
  'Reclining Sofa on Locke St',
  'Chair on Elm St',
  'TV Stand on Maple Ave',
  'Sofa on Pine St',
  'DIY Furniture Restoration'
]

puts "creating chatrooms"

posts = Post.all

chatroom_names.each_with_index do |chatroom_name, index|
   Chatroom.create!(name: chatroom_name, post: posts[index])
end
puts "chatrooms created"
