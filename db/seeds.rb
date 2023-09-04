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
  { user_id: first_ten_user_ids[0], location: '503/9 Eades Street, East Melbourne', description: 'Hard waste collection in East Melbourne', council_pickup_date: '2023-09-10' },
  { user_id: first_ten_user_ids[1], location: '803a/609 Victoria Street, Abbotsford', description: 'Free kerbside hard rubbish in Abbotsford', council_pickup_date: '2023-09-12' },
  { user_id: first_ten_user_ids[2], location: '136 Nicholson Street, Fitzroy', description: 'Bulky rubbish in Fitzroy', council_pickup_date: '2023-09-15' },
  { user_id: first_ten_user_ids[3], location: '42/1 Queensberry Street, Carlton', description: 'Useful recycling stuff in Carlton', council_pickup_date: '2023-09-17' },
  { user_id: first_ten_user_ids[4], location: '111 Pine St Albans, Melbourne', description: 'Free pick ups due to relocation on Pine St', council_pickup_date: '2023-09-19' },
  { user_id: first_ten_user_ids[5], location: '7/14-22 Waterloo Street, Carlton', description: 'Stuff to be rescued from trash in Carlton', council_pickup_date: '2023-09-21' },
  { user_id: first_ten_user_ids[6], location: '5 Davison Place South Yarra', description: 'Old furniture pick up in South Yarra', council_pickup_date: '2023-09-23' },
  { user_id: first_ten_user_ids[7], location: '9/315 Flemington Rd North Melbourne', description: 'Free annual hard waste on Flemington Rd', council_pickup_date: '2023-09-23' },
  { user_id: first_ten_user_ids[8], location: '605/60 Stanley Street, Collingwood', description: 'Bulky waste in Collingwood', council_pickup_date: '2023-09-25' },
  { user_id: first_ten_user_ids[9], location: '336 Russell St Melbourne', description: 'Waste & Rubbish removal on Russell St', council_pickup_date: '2023-09-27' },
  { user_id: first_ten_user_ids[0], location: '11 Sherwin Street, Kensington', description: 'Curbside furniture in Kensington', council_pickup_date: '2023-09-29' },
  { user_id: first_ten_user_ids[1], location: '109/91 Dow Street, Port Melbourne', description: 'Free recycling items in Port Melbourne', council_pickup_date: '2023-09-11' },
  { user_id: first_ten_user_ids[2], location: '902/33 Rose Lane, Melbourne, Australia', description: 'Useful free items on Rose Lane St', council_pickup_date: '2023-09-13' },
  { user_id: first_ten_user_ids[3], location: '1504/392 Spencer Street, West Melbourne', description: 'Moving house leftovers in West Melbourne', council_pickup_date: '2023-09-14' },
  { user_id: first_ten_user_ids[4], location: '908/65 Coventry Street, Southbank', description: 'Junk removal in Southbank', council_pickup_date: '2023-09-15' },
  { user_id: first_ten_user_ids[5], location: '26 Rowena Parade, Richmond', description: 'Hard rubbish cleanup, pick up in Richmond', council_pickup_date: '2023-09-16' },
  { user_id: first_ten_user_ids[6], location: '2802/327 La Trobe Street, Melbourne', description: 'Hard rubbish furniture. Pick up on La Trobe St', council_pickup_date: '2023-09-18' },
  { user_id: first_ten_user_ids[7], location: '7/557 Glenferrie Road, Hawthorn', description: 'Out on the curb in Hawthorn', council_pickup_date: '2023-09-20' },
  { user_id: first_ten_user_ids[8], location: '22 Collins Street, Essendon', description: 'House renovation leftovers available in Essendon', council_pickup_date: '2023-09-22' },
  { user_id: first_ten_user_ids[9], location: '82 Raglan Street, Preston', description: 'Kerbside rubbish waiting for collection in Preston', council_pickup_date: '2023-09-24' }
]

post_photo_urls = [
  "https://th.bing.com/th/id/OIP.2sn2IFScbS8exwV8PDs09gHaE8?w=231&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://th.bing.com/th/id/OIP.lIOS0_rwH2jRLLHUO5sO7wHaE8?pid=ImgDet&w=204&h=136&c=7&dpr=1.5",
  "https://www.wyndham.vic.gov.au/sites/default/files/styles/embedded_large_1x/public/2020-05/hard%20waste2.jpg?itok=x-cM9htu",
  "https://i2-prod.dailyrecord.co.uk/incoming/article4118179.ece/ALTERNATES/s615/FlyTipping.jpg",
  "https://th.bing.com/th/id/OIP.Sf3NnCH6xTSdvbGw46EKsAHaEI?w=289&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
  "https://cdn.aprettyhappyhome.com/wp-content/uploads/2018/12/06141947/trash-painting-1.jpg",
  "https://www.mercurynews.com/wp-content/uploads/2017/09/harvey-garbage_3.jpg?w=525",
  "https://th.bing.com/th/id/OIP.wvvHutq99R-_l6Q_nOtjFAAAAA?pid=ImgDet&w=204&h=136&c=7&dpr=1.5",
  "https://th.bing.com/th/id/R.2e58f152f04f7c9f0805f024354ac75c?rik=GbZayU6Xu8%2bx4g&riu=http%3a%2f%2fcdn.newsapi.com.au%2fimage%2fv1%2f760544ecb19036c8472088f2422a4e9b%3fwidth%3d1024&ehk=wh23%2b7niydLA8Ft4X1FdzWeR6zpiLXWHJdx1pz62zcg%3d&risl=&pid=ImgRaw&r=0",
  "https://th.bing.com/th/id/R.580ef19d5fbde9867ca892e59ee14669?rik=bpKt%2blbDbuxtjw&riu=http%3a%2f%2f2.bp.blogspot.com%2f-XImWk6sxsbU%2fT9CbzhAW25I%2fAAAAAAAAAA0%2fQNs7AGLnsXw%2fs1600%2f1104104.jpg&ehk=YGpnRhqQ6grrhRiLk%2bZEHY0F%2fyAX2rpnLaILN%2bN9jNU%3d&risl=&pid=ImgRaw&r=0",
  "https://th.bing.com/th/id/OIP.fs6N5v3pKYHJ0OJjCIfuVgHaEL?pid=ImgDet&w=204&h=115&c=7&dpr=1.5",
  "https://3.bp.blogspot.com/-5Fy18rZxDqA/WULACXNFhuI/AAAAAAAAGdc/eRSJ_yJFi9gsruX5bDtrSDlCT_LGnAYlwCEwYBhgL/s400/Windmill%2BFarm%2BRaffia%2Bpurse%2B036.jpg",
  "https://www.roselleparknews.org/wp-content/uploads/2015/02/Bulk-Pick-Up.jpg",
  "https://www.lovelanddumpsters.com/wp-content/uploads/2020/06/Whole-House-Clean-Out-Dumpster-Services-Loveland-Premier-Dumpster-Rental-Services-1024x768.jpg",
  "https://s3-media0.fl.yelpcdn.com/bphoto/EA1c6myvpVNMPyXqNnC9CQ/o.jpg",
  "https://th.bing.com/th/id/OIP.tZItjUoIBnSE4yFLt5Td6AHaFj?pid=ImgDet&rs=1",
  "https://th.bing.com/th/id/R.3ceadf3cc3b8702908d77b6aee75ca19?rik=g7JLw7eWjDU2lQ&riu=http%3a%2f%2fi2.cdn.turner.com%2fmoney%2fdam%2fassets%2f120912032956-foreclosed-home-tablet-large.jpg&ehk=EYbHR6UfK%2fJ0lKBo6RiLhi4KDNv86CK%2f7DMZkvZYHDE%3d&risl=&pid=ImgRaw&r=0",
  "https://coastcommunitynews.com.au/wp-content/uploads/2022/05/Kerbside-collectionP2-CCN339-e1651479885952-777x437.jpg",
  "https://resources.stuff.co.nz/content/dam/images/4/y/o/f/5/m/image.related.StuffLandscapeSixteenByNine.1420x800.4yof5w.png/1600406029225.jpg",
  "https://images.offerup.com/h6gKhRH944vOrr9tTSWBxHxBvo4=/1440x1920/87d4/87d422b523474970985e8193d55c0e37.jpg"
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
  'High-quality study chair',
  'Fully functional TV',
  'Comfy recycling sofa ',
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
  'Modern fluffy carpet for bedroom or living area',
  'High efficiency cooling fan',
  'Table lamp in excellent working order',
  'Cute outdoor setting. Was in shade so still looks new',
  'Kitchen appliances. Mixer KSM150 with 4 attachments',
  'Plastic storage containers',
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
  "Hard waste collection in East Melbourne",
  "Free kerbside hard rubbish in Abbotsford",
  "Bulky rubbish in Fitzroy",
  "Useful recycling stuff in Carlton",
  "Free pick ups due to relocation on Pine St",
  "Stuff to be rescued from trash in Carlton",
  "Old furniture pick up in South Yarra",
  "Free annual hard waste on Flemington Rd",
  "Bulky waste in Collingwood",
  "Waste & Rubbish removal on Russell St",
  "Curbside furniture in Kensington",
  "Free recycling items in Port Melbourne",
  "Useful free items on Rose Lane St",
  "Moving house leftovers in West Melbourne",
  "Junk removal in Southbank",
  "Hard rubbish cleanup, pick up in Richmond",
  "Hard rubbish furniture. Pick up on La Trobe St",
  "Out on the curb in Hawthorn",
  "House renovation leftovers available in Essendon",
  "Kerbside rubbish waiting for collection in Preston"
]

puts "creating chatrooms"

posts = Post.all

chatroom_names.each_with_index do |chatroom_name, index|
   Chatroom.create!(name: chatroom_name, post: posts[index])
end

#link your posts to a chatrooms

puts "chatrooms created"

# Seed data for Messages
puts "creating messages"

messages_data = [
  { user_id: first_ten_user_ids[0], chatroom_id: 1, content: 'Hi, is this chair still available??' },
  { user_id: first_ten_user_ids[1], chatroom_id: 1, content: 'Im interested in plastic containers, will pick it up today.' },
  { user_id: first_ten_user_ids[2], chatroom_id: 1, content: 'Great stuff, going to stop by in 2 hrs, thanks!' },
  { user_id: first_ten_user_ids[3], chatroom_id: 2, content: 'Hey, can I pick up TV around lunch time today?' },
  { user_id: first_ten_user_ids[4], chatroom_id: 2, content: 'Great TV! Urgently need one toooo' },
  { user_id: first_ten_user_ids[3], chatroom_id: 2, content: 'IM COMING!!!' },
  { user_id: first_ten_user_ids[5], chatroom_id: 3, content: 'Hello, im looking for sofa, can you please keep it for me for tomorrow? Just need to organize a truck, thanks a lot!' },
  { user_id: first_ten_user_ids[6], chatroom_id: 3, content: 'Is that TV still available?' },
  { user_id: first_ten_user_ids[7], chatroom_id: 3, content: 'I will come over after work to look at mattress …' },
  { user_id: first_ten_user_ids[8], chatroom_id: 4, content: 'Hi there. Washing machine looks great! Please keep it for me for few hrs …' },
  { user_id: first_ten_user_ids[9], chatroom_id: 4, content: 'Im also interested in washing machine … Can I get it asap?' },
  { user_id: first_ten_user_ids[8], chatroom_id: 4, content: 'IM ON MY WAY!' },
  { user_id: first_ten_user_ids[1], chatroom_id: 5, content: 'Hey, im coming now to get the table! Thanks' },
  { user_id: first_ten_user_ids[2], chatroom_id: 5, content: 'Hi, is kids bicycle in working condition?' },
  { user_id: first_ten_user_ids[1], chatroom_id: 5, content: 'Im trying to find your house but got lost, could you please call me at +61 456457179' }
]

messages = []

messages_data.each do |data|
  messages << Message.create!(data)
end

puts "messages created"
