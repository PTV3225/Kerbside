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



puts "creating videos"

video_data = [
  { title: 'DIY Chair Restoration', description: Faker::Hobby.activity, url: 'https://youtu.be/Ek-EE37rPUQ' },
  { title: 'Fixing a Broken TV', description: Faker::Hobby.activity, url: 'https://youtu.be/hJGmrQDbUOQ' },
  { title: 'Upcycling Old Sofas', description: Faker::Hobby.activity, url: 'https://youtu.be/BrjN4vmwbuw' },
  { title: 'Most common fix of washing machine', description: Faker::Hobby.activity, url: 'https://youtu.be/KmPlBZ5nT1Q' },
  { title: 'How to refinish a table // DIY Furniture Makeover', description: Faker::Hobby.activity, url: 'https://youtu.be/T1is7gKwkGA' },
  { title: 'How to REUSE an Old Canvas Painting', description: Faker::Hobby.activity, url: 'https://youtu.be/KdX4REYfcuc' },
  { title: 'DIY Dream Closet on a Budget', description: Faker::Hobby.activity, url: 'https://youtu.be/h-Lnx2_AZd4' },
  { title: 'Unique Bike Restoration', description: Faker::Hobby.activity, url: 'https://youtu.be/Tw7XNRoSdSE' },
  { title: 'Deep Cleaning Mattress', description: Faker::Hobby.activity, url: 'https://youtu.be/5ZYRGd0kblI' },
  { title: 'Incredible Restoration Of An Old Fridges', description: Faker::Hobby.activity, url: 'https://youtu.be/zKsOIoR1HlM' },
  { title: 'Bookshelf Makeover', description: Faker::Hobby.activity, url: 'https://youtu.be/U4SbxdcXf1Y' },
  { title: 'Easiest Way to Restore Rusty Garden Tools', description: Faker::Hobby.activity, url: 'https://youtu.be/nFFiqwKCZvM' },
  { title: 'How To Clean/Sanitize/Disinfect Kids Toys', description: Faker::Hobby.activity, url: 'https://youtu.be/aqPP-LmUwZA' },
  { title: 'DIY carpet cleaning solution', description: Faker::Hobby.activity, url: 'https://youtu.be/SYT-Jc0jAvc' },
  { title: 'How to repair fan - step by step instructions', description: Faker::Hobby.activity, url: 'https://youtu.be/i8fIXpSC28I' },
  { title: 'BEFORE and AFTER: lamp makeover from the thrift store', description: Faker::Hobby.activity, url: 'https://youtu.be/X4pc2Fef7Nk' },
  { title: 'How to restore outdoor furniture. A beginner guide', description: Faker::Hobby.activity, url: 'https://youtu.be/iHdfBVT_V0c' },
  { title: 'KitchenAid stand mixer wobble fix and tune up', description: Faker::Hobby.activity, url: 'https://youtu.be/DaC3ARrJ5yw' },
  { title: 'BOUGHT CHEAP PLASTIC BASKETS AND TURNED THEM INTO A TREASURE| DIY BASKET', description: Faker::Hobby.activity, url: 'https://youtu.be/O8WSCxXy2JA' },
  { title: 'How to clean up old weights - Restore them like NEW', description: Faker::Hobby.activity, url: 'https://youtu.be/Gfvfek0HIiA' }
]

videos = []

video_data.each do |data|
  videos << Video.create!(data)
end

puts "Videos created"

# Seed data for Posts (addresses for location)

puts "creating posts and attaching photos"

first_ten_user_ids = User.limit(10).pluck(:id)

posts_data = [
  { user_id: first_ten_user_ids[0], location: '789 Elm St Maribyrnong', description: 'Sturdy chair ready for pickup on Elm St', council_pickup_date: '2023-09-10' },
  { user_id: first_ten_user_ids[1], location: '123 Smith St Toorak', description: 'Great TV in working order at Smith St', council_pickup_date: '2023-09-12' },
  { user_id: first_ten_user_ids[2], location: '456 Locke St East Malvern', description: 'Comfy reclining sofa available on Locke St', council_pickup_date: '2023-09-15' },
  { user_id: first_ten_user_ids[3], location: '101 Maple Ave Dandenong', description: 'Washing machine stand up for grabs on Maple Ave', council_pickup_date: '2023-09-17' },
  { user_id: first_ten_user_ids[4], location: '111 Pine St St Albans, Melbourne', description:'Almost brand new table looking for a new home on Pine St', council_pickup_date: '2023-09-19' },
  { user_id: first_ten_user_ids[5], location: '222 Oak St St Kilda', description: 'Beautiful painting that will brighten up any room on Oak St', council_pickup_date: '2023-09-21' },
  { user_id: first_ten_user_ids[6], location: '5 Davison Place South Yarra', description: 'Closet in great condition in South Yarra', council_pickup_date: '2023-09-23' },
  { user_id: first_ten_user_ids[7], location: '9/315 Flemington Rd North Melbourne', description: 'Commuting bicycle with good seat but with a bit of rust on chain on Flemington Rd', council_pickup_date: '2023-09-23' },
  { user_id: first_ten_user_ids[8], location: '207/557 Little Lonsdale Street', description: 'Sleepmaker queen size mattress with bed frame on Little Lonsdale Street', council_pickup_date: '2023-09-25' },
  { user_id: first_ten_user_ids[9], location: '336 Russell St Melbourne', description: 'Hisense refrigerator in perfect condition working perfectly order on Russell St,', council_pickup_date: '2023-09-27' },
  { user_id: first_ten_user_ids[0], location: '207/422-428 Collins, Street Melboune', description: 'Great condition IKEA bookshelf, nothing cracked and broken issues on Collins St,', council_pickup_date: '2023-09-29' },
  { user_id: first_ten_user_ids[1], location: '109/91 Dow Street, Port Melbourne', description: 'Gardening equipment free to pick up in Port Melbourne', council_pickup_date: '2023-09-11' },
  { user_id: first_ten_user_ids[2], location: '902/33 Rose Lane Melbourne', description: 'Kids toys mini cute miniatures high quality animals models figures on Rose Lane St', council_pickup_date: '2023-09-13' },
  { user_id: first_ten_user_ids[3], location: '902/259-273 Normanby Rd, South Melbourne', description: 'Modern fluffy carpet for bedroom or living area in South Melbourne', council_pickup_date: '2023-09-14' },
  { user_id: first_ten_user_ids[4], location: '908/65 Coventry Street, Southbank', description: 'High efficiency cooling fan in Southbank', council_pickup_date: '2023-09-15' },
  { user_id: first_ten_user_ids[5], location: '924/199 William Street', description: 'Floor lamp in excellent working order pick up on William St', council_pickup_date: '2023-09-16' },
  { user_id: first_ten_user_ids[6], location: '2802/327 La Trobe Street, Melbourne', description: 'Cute outdoor setting. Was in shade so still looks new. Pick up on La Trobe St', council_pickup_date: '2023-09-18' },
  { user_id: first_ten_user_ids[7], location: '7/15 Cromwell Road, South Yarra', description: 'Kitchen appliances. Kitchenaid stand mixer KSM150 with 4 attachments in South Yarra', council_pickup_date: '2023-09-20' },
  { user_id: first_ten_user_ids[8], location: '22 Collins Street, Essendon', description: 'Plastic storage containers available in Essendon', council_pickup_date: '2023-09-22' },
  { user_id: first_ten_user_ids[9], location: '82 Raglan Street, Preston', description: 'Home gym equipment in great condition in Preston', council_pickup_date: '2023-09-24' }
]

post_photo_urls = [
  "https://images.unsplash.com/photo-1506898667547-42e22a46e125?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fGNoYWlyfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://plus.unsplash.com/premium_photo-1661497658228-cd6f13a4d39c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQ4fHxtb2Rlcm4lMjB0dnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://plus.unsplash.com/premium_photo-1673548917423-073963e7afc9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGZ1cm5pdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1626806787426-5910811b6325?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHdhc2hpbmclMjBtYWNoaW5lfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1533090481720-856c6e3c1fdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHRhYmxlfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1674503718104-950f67b26f9a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQ3fHxwYWludGluZ3MlMjBsaXZpbmclMjByb29tfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1558997519-83ea9252edf8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNsb3NldHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1618762044398-ec1e7e048bbd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGJpY3ljbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1613688684609-f93cb0f5f73e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8TWF0dHJlc3N8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8UmVmcmlnZXJhdG9yfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1528208079124-a2387f039c99?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fEJvb2tzaGVsZnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60 ",
  "https://images.unsplash.com/photo-1563210199-6ec2cfedd11e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8R2FyZGVuJTIwVG9vbHN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60 ",
  "https://images.unsplash.com/photo-1659652272218-c6cd2ae219a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDU1fHxLaWRzJyUyMFRveXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1621700052663-f1170e9b26ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fENhcnBldHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1565151443833-29bf2ba5dd8d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OTB8fEVsZWN0cm9uaWMlMjBXYXN0ZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1580130281320-0ef0754f2bf7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGxhbXB8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1617887021567-fe8d2480bd96?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fG91dGRvb3IlMjBmdXJuaXR1cmV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1583241475880-083f84372725?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8S2l0Y2hlbiUyMEFwcGxpYW5jZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1564995069826-6338a9192279?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGxhc3RpYyUyMGJveHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60 ",
  "https://images.unsplash.com/photo-1620188526357-ff08e03da266?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fEV4ZXJjaXNlJTIwRXF1aXBtZW50fGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60"
]

posts_data.each_with_index do |post_data, index|
  post = Post.create!(post_data)
  file = URI.open(post_photo_urls[index])
  post.photos.attach(io: file, filename: "photo_#{index}.png", content_type: "image/png")
end
puts "Posts created"

# Seed data for Treasures

# Descriptions for the new records treasures_data
descriptions = [
  'High-quality chair',
  'Fully functional TV',
  'Comfy reclining sofa',
  'Washing machine in good condition',
  'Almost brand new table',
  'Beautiful painting for living room',
  'Closet in great condition',
  'Commuting bicycle with good seat',
  'Sleepmaker queen size mattress',
  'Hisense refrigerator in perfect condition',
  'Great condition IKEA bookshelf',
  'Gardening equipment free to pick up',
  'High quality kids toys',
  'Modern carpet for bedroom or living area',
  'High efficiency cooling fan',
  'Floor lamp in excellent working order',
  'Cute outdoor setting',
  'Kitchen appliances. Mixer KSM150 with 4 attachments',
  'Storage containers',
  'Home gym equipment in great condition'
]

categories = ['Chair', 'TV', 'Sofa', 'Washing machine', 'Table', 'Painting', 'Closet', 'Bicycle', 'Mattress', 'Refrigerator', 'Bookshelf', 'Garden Tools', 'Kids Toys', 'Carpet', 'Fan', 'Lamp', 'Kitchen appliances', 'Outdoor furniture', 'Storage containers', 'Exercise equipment' ]

puts "Creating Treasure Type with attached videos"

20.times do |index|
  TreasureType.create!(category: categories[index], video_id: Video.all[index].id)
end

puts "Treasure Type and attached videos created"

puts "Creating Treasures and attaching photos"

20.times do |index|
  Treasure.create!(treasure_type_id: TreasureType.all[index].id, status: true, post_id: Post.all[index].id, description: descriptions[index])
end

treasure_photo_urls = [
  "https://images.unsplash.com/photo-1506898667547-42e22a46e125?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fGNoYWlyfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://plus.unsplash.com/premium_photo-1661497658228-cd6f13a4d39c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQ4fHxtb2Rlcm4lMjB0dnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://plus.unsplash.com/premium_photo-1673548917423-073963e7afc9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGZ1cm5pdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1626806787426-5910811b6325?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHdhc2hpbmclMjBtYWNoaW5lfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1533090481720-856c6e3c1fdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHRhYmxlfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1674503718104-950f67b26f9a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQ3fHxwYWludGluZ3MlMjBsaXZpbmclMjByb29tfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1558997519-83ea9252edf8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNsb3NldHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1618762044398-ec1e7e048bbd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGJpY3ljbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1613688684609-f93cb0f5f73e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8TWF0dHJlc3N8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8UmVmcmlnZXJhdG9yfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1528208079124-a2387f039c99?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fEJvb2tzaGVsZnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1563210199-6ec2cfedd11e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8R2FyZGVuJTIwVG9vbHN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1659652272218-c6cd2ae219a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDU1fHxLaWRzJyUyMFRveXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1621700052663-f1170e9b26ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fENhcnBldHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1565151443833-29bf2ba5dd8d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OTB8fEVsZWN0cm9uaWMlMjBXYXN0ZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1580130281320-0ef0754f2bf7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGxhbXB8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1617887021567-fe8d2480bd96?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fG91dGRvb3IlMjBmdXJuaXR1cmV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1583241475880-083f84372725?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8S2l0Y2hlbiUyMEFwcGxpYW5jZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1564995069826-6338a9192279?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGxhc3RpYyUyMGJveHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
  "https://images.unsplash.com/photo-1620188526357-ff08e03da266?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fEV4ZXJjaXNlJTIwRXF1aXBtZW50fGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60"
]

Treasure.all.each_with_index do |treasure, index|
  file = URI.open(treasure_photo_urls[index])
 Treasure.all[index].photo.attach(io: file, filename: "photo_#{index}.png", content_type: "image/png")
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

#link your posts to a chatrooms

puts "chatrooms created"
