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
Video.destroy_all
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
  { title: 'DIY Chair Restoration', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/Ek-EE37rPUQ' },
  { title: 'Fixing a Broken TV', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/hJGmrQDbUOQ' },
  { title: 'Upcycling Old Sofas', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/BrjN4vmwbuw' },
  { title: 'Most common fix of washing machine', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/KmPlBZ5nT1Q' },
  { title: 'How to refinish a table // DIY Furniture Makeover', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/T1is7gKwkGA' },
  { title: 'How to REUSE an Old Canvas Painting', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/KdX4REYfcuc' },
  { title: 'DIY Dream Closet on a Budget', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/h-Lnx2_AZd4' },
  { title: 'Unique Bike Restoration', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/Tw7XNRoSdSE' },
  { title: 'Deep Cleaning Mattress', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/5ZYRGd0kblI' },
  { title: 'Incredible Restoration Of An Old Fridges', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/zKsOIoR1HlM' },
  { title: 'Bookshelf Makeover', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/U4SbxdcXf1Y' },
  { title: 'Easiest Way to Restore Rusty Garden Tools', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/nFFiqwKCZvM' },
  { title: 'How To Clean/Sanitize/Disinfect Kids Toys', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/aqPP-LmUwZA' },
  { title: 'DIY carpet cleaning solution', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/SYT-Jc0jAvc' },
  { title: 'How to repair fan - step by step instructions', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/i8fIXpSC28I' },
  { title: 'BEFORE and AFTER: lamp makeover from the thrift store', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/X4pc2Fef7Nk' },
  { title: 'How to restore outdoor furniture. A beginner guide', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/iHdfBVT_V0c' },
  { title: 'KitchenAid stand mixer wobble fix and tune up', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/DaC3ARrJ5yw' },
  { title: 'BOUGHT CHEAP PLASTIC BASKETS AND TURNED THEM INTO A TREASURE| DIY BASKET', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/O8WSCxXy2JA' },
  { title: 'How to clean up old weights - Restore them like NEW', description: Faker::Hobby.activity, url: 'https://www.youtube.com/embed/Gfvfek0HIiA' }
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
  { user_id: first_ten_user_ids[0], location: '503/9 Eades Street, East Melbourne', description: 'Sturdy chair ready for pickup in East Melbourne', council_pickup_date: '2023-09-10' },
  { user_id: first_ten_user_ids[1], location: '803a/609 Victoria Street, Abbotsford', description: 'Great TV in working order in Abbotsford', council_pickup_date: '2023-09-12' },
  { user_id: first_ten_user_ids[2], location: '136 Nicholson Street, Fitzroy', description: 'Comfy reclining sofa available in Fitzroy', council_pickup_date: '2023-09-15' },
  { user_id: first_ten_user_ids[3], location: '42/1 Queensberry Street, Carlton', description: 'Washing machine stand up for grabs in Carlton', council_pickup_date: '2023-09-17' },
  { user_id: first_ten_user_ids[4], location: '111 Pine St St Albans, Melbourne', description:'Almost brand new table looking for a new home on Pine St', council_pickup_date: '2023-09-19' },
  { user_id: first_ten_user_ids[5], location: '7/14-22 Waterloo Street, Carlton', description: 'Beautiful painting that will brighten up any room in Carlton', council_pickup_date: '2023-09-21' },
  { user_id: first_ten_user_ids[6], location: '5 Davison Place South Yarra', description: 'Closet in great condition in South Yarra', council_pickup_date: '2023-09-23' },
  { user_id: first_ten_user_ids[7], location: '9/315 Flemington Rd North Melbourne', description:  'Commuting bicycle with good seat but with a bit of rust on chain on Flemington Rd', council_pickup_date: '2023-09-23' },
  { user_id: first_ten_user_ids[8], location: '605/60 Stanley Street, Collingwood', description: 'Sleepmaker queen size mattress with bed frame in Collingwood', council_pickup_date: '2023-09-25' },
  { user_id: first_ten_user_ids[9], location: '336 Russell St Melbourne', description: 'Hisense refrigerator in perfect condition working perfectly order on Russell St,', council_pickup_date: '2023-09-27' },
  { user_id: first_ten_user_ids[0], location: '11 Sherwin Street, Kensington', description: 'Great condition IKEA bookshelf, nothing cracked and broken issues in Kensington,', council_pickup_date: '2023-09-29' },
  { user_id: first_ten_user_ids[1], location: '109/91 Dow Street, Port Melbourne', description: 'Gardening equipment free to pick up in Port Melbourne', council_pickup_date: '2023-09-11' },
  { user_id: first_ten_user_ids[2], location: '902/33 Rose Lane, Melbourne, Australia', description: 'Kids toys mini cute miniatures high quality animals models figures on Rose Lane St', council_pickup_date: '2023-09-13' },
  { user_id: first_ten_user_ids[3], location: '1504/392 Spencer Street, West Melbourne', description: 'Modern fluffy carpet for bedroom or living area in West Melbourne', council_pickup_date: '2023-09-14' },
  { user_id: first_ten_user_ids[4], location: '908/65 Coventry Street, Southbank', description: 'High efficiency cooling fan in Southbank', council_pickup_date: '2023-09-15' },
  { user_id: first_ten_user_ids[5], location: '26 Rowena Parade, Richmond', description: 'Table lamp in excellent working order pick up in Richmond', council_pickup_date: '2023-09-16' },
  { user_id: first_ten_user_ids[6], location: '2802/327 La Trobe Street, Melbourne', description: 'Cute outdoor setting. Was in shade so still looks new. Pick up on La Trobe St', council_pickup_date: '2023-09-18' },
  { user_id: first_ten_user_ids[7], location: '7/557 Glenferrie Road, Hawthorn', description: 'Kitchen appliances. Kitchenaid stand mixer KSM150 with 4 attachments in Hawthorn', council_pickup_date: '2023-09-20' },
  { user_id: first_ten_user_ids[8], location: '22 Collins Street, Essendon', description: 'Plastic storage containers available in Essendon', council_pickup_date: '2023-09-22' },
  { user_id: first_ten_user_ids[9], location: '82 Raglan Street, Preston', description: 'Home gym equipment in great condition in Preston', council_pickup_date: '2023-09-24' }
]

post_photo_urls = [
  "https://th.bing.com/th/id/OIP.H2eTStrsHTEh4RkmG_ckxQHaHa?w=203&h=203&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://i.ebayimg.com/00/s/NzY4WDEwMjQ=/z/K88AAOSwoxlc66fa/$_86.JPG",
  "https://i.ebayimg.com/00/s/NzY4WDEwMjQ=/z/tewAAOSw2Zld5xfC/$_86.JPG",
  "https://i.ebayimg.com/00/s/MTAyNFg5MTE=/z/gjMAAOSwUCpfCdRh/$_86.JPG",
  "https://i.ebayimg.com/00/s/NzY4WDEwMjQ=/z/X1cAAOSwSutaOQf7/$_86.JPG",
  "https://dygtyjqp7pi0m.cloudfront.net/i/27574/24467966_1.jpg?v=8D35B1EECE4B550",
  "https://www.antiquers.com/attachments/closet-2-jpg.286501/",
  "https://th.bing.com/th/id/R.047f09255e63aea658fe8f424c1620cc?rik=z6%2faJPPnHWJUTA&pid=ImgRaw&r=0",
  "https://i.ebayimg.com/00/s/NzY4WDEwMjQ=/z/YAoAAOSwZnlbYK2b/$_86.JPG",
  "https://www.payyattention.com/wp-content/uploads/2018/07/cheap-used-refrigerator-for-sale-near-me-768x707.jpg",
  "https://th.bing.com/th/id/R.ee423ebccecb6c471739cd1ebde972f1?rik=XZ9izONQjEDZcQ&pid=ImgRaw&r=0",
  "https://th.bing.com/th/id/OIP.mJ3w5513LkvMbdYp0R_xxgHaFj?w=259&h=194&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.MKEtdURyNxIan2wBofwKGAHaHa?w=187&h=187&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.R86JZcUNOODP3VWd0y8vFQHaJ4?w=122&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.T-FwPSVE79ji6LzhkkPa7wHaHa?w=183&h=183&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.ICjbT5XzNmPhoydJk7gnVgHaLI?w=203&h=306&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.5CQbzeKZneqP6MsONyCXkgHaE8?w=301&h=201&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.anmmspPFykZxjuc37908SgHaJ4?w=152&h=203&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.ZhVj9HpFWixdf7_iVflAXwHaHa?w=175&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.EHUs6VbBRATJTayQBPuUMQHaGr?w=234&h=210&c=7&r=0&o=5&dpr=1.5&pid=1.7"
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
  'Table lamp in excellent working order',
  'Cute outdoor setting',
  'Kitchen appliances. Mixer KSM150 with 4 attachments',
  'Storage containers',
  'Home gym equipment in great condition'
]

categories = ['Chair', 'TV', 'Sofa', 'Washing machine', 'Table', 'Painting', 'Closet', 'Bicycle', 'Mattress', 'Refrigerator', 'Bookshelf', 'Garden Tools', 'Kids Toys', 'Carpet', 'Fan', 'Lamp', 'Outdoor furniture', 'Kitchen appliances', 'Storage containers', 'Exercise equipment' ]

puts "Creating Treasure Type with attached videos"

20.times do |index|
  TreasureType.create!(category: categories[index], video_id: Video.all[index].id)
end

puts "Treasure Type and attached videos created"

puts "Creating Treasures and attaching photos"

20.times do |index|
  Treasure.create!(treasure_type_id: TreasureType.all[index].id, status: :available, post_id: Post.all[index].id, description: descriptions[index])
end

treasure_photo_urls = [
  "https://th.bing.com/th/id/OIP.H2eTStrsHTEh4RkmG_ckxQHaHa?w=203&h=203&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://i.ebayimg.com/00/s/NzY4WDEwMjQ=/z/K88AAOSwoxlc66fa/$_86.JPG",
  "https://i.ebayimg.com/00/s/NzY4WDEwMjQ=/z/tewAAOSw2Zld5xfC/$_86.JPG",
  "https://i.ebayimg.com/00/s/MTAyNFg5MTE=/z/gjMAAOSwUCpfCdRh/$_86.JPG",
  "https://i.ebayimg.com/00/s/NzY4WDEwMjQ=/z/X1cAAOSwSutaOQf7/$_86.JPG",
  "https://dygtyjqp7pi0m.cloudfront.net/i/27574/24467966_1.jpg?v=8D35B1EECE4B550",
  "https://www.antiquers.com/attachments/closet-2-jpg.286501/",
  "https://th.bing.com/th/id/R.047f09255e63aea658fe8f424c1620cc?rik=z6%2faJPPnHWJUTA&pid=ImgRaw&r=0",
  "https://i.ebayimg.com/00/s/NzY4WDEwMjQ=/z/YAoAAOSwZnlbYK2b/$_86.JPG",
  "https://www.payyattention.com/wp-content/uploads/2018/07/cheap-used-refrigerator-for-sale-near-me-768x707.jpg",
  "https://th.bing.com/th/id/R.ee423ebccecb6c471739cd1ebde972f1?rik=XZ9izONQjEDZcQ&pid=ImgRaw&r=0",
  "https://th.bing.com/th/id/OIP.mJ3w5513LkvMbdYp0R_xxgHaFj?w=259&h=194&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.MKEtdURyNxIan2wBofwKGAHaHa?w=187&h=187&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.R86JZcUNOODP3VWd0y8vFQHaJ4?w=122&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.T-FwPSVE79ji6LzhkkPa7wHaHa?w=183&h=183&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.ICjbT5XzNmPhoydJk7gnVgHaLI?w=203&h=306&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.5CQbzeKZneqP6MsONyCXkgHaE8?w=301&h=201&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.anmmspPFykZxjuc37908SgHaJ4?w=152&h=203&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.ZhVj9HpFWixdf7_iVflAXwHaHa?w=175&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.EHUs6VbBRATJTayQBPuUMQHaGr?w=234&h=210&c=7&r=0&o=5&dpr=1.5&pid=1.7"
]

Treasure.all.each_with_index do |treasure, index|
  file = URI.open(treasure_photo_urls[index])
  treasure.photo.attach(io: file, filename: "photo_#{index}.png", content_type: "image/png")
end

puts "Treasures created"
# Seed data for Chatrooms

chatroom_names = [
  "Sturdy chair ready for pickup in East Melbourne",
  "Great TV in working order in Abbotsford",
  "Comfy reclining sofa available in Fitzroy",
  "Washing machine stand up for grabs in Carlton",
  "Almost brand new table looking for a new home on Pine St",
  "Beautiful painting that will brighten up any room in Carlton",
  "Closet in great condition in South Yarra",
  "Commuting bicycle with good seat but with a bit of rust on chain on Flemington Rd",
  "Sleepmaker queen size mattress with bed frame in Collingwood",
  "Hisense refrigerator in perfect condition working perfectly order on Russell St",
  "Great condition IKEA bookshelf, nothing cracked and broken issues in Kensington",
  "Gardening equipment free to pick up in Port Melbourne",
  "Kids toys mini cute miniatures high quality animals models figures on Rose Lane St",
  "Modern fluffy carpet for bedroom or living area in West Melbourne",
  "High efficiency cooling fan in Southbank",
  "Table lamp in excellent working order pick up in Richmond",
  "Cute outdoor setting. Was in shade so still looks new. Pick up on La Trobe St",
  "Kitchen appliances. Kitchenaid stand mixer KSM150 with 4 attachments in Hawthorn",
  "Plastic storage containers available in Essendon",
  "Home gym equipment in great condition in Preston"
]


puts "creating chatrooms"

posts = Post.all

chatroom_names.each_with_index do |chatroom_name, index|
   Chatroom.create!(name: chatroom_name, post: posts[index])
end

#link your posts to a chatrooms

puts "chatrooms created"
