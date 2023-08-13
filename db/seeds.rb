# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "clearing database"

User.destroy_all
TreasureType.destroy_all
Post.destroy_all
Treasure.destroy_all
Chatroom.destroy_all

puts "creating database"

# Seed data for Users

40.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

# Seed data for Admin User
admin_user = User.create!(
  email: 'admin@example.com',
  password: 'adminpassword',
  first_name: 'Admin',
  last_name: 'User'
)

videos = [
  { title: 'DIY Chair Restoration', description: Faker::Hobby.activity, url: 'https://youtu.be/Ek-EE37rPUQ' },
  { title: 'Fixing a Broken TV', description: Faker::Hobby.activity, url: 'https://youtu.be/hJGmrQDbUOQ' },
  { title: 'Upcycling Old Sofas', description: Faker::Hobby.activity, url: 'https://youtu.be/BrjN4vmwbuw' }

]
videos = Video.create!(videos)

treasure_types = [
  { treasure_type: 'Chair', video: videos[0] },
  { treasure_type: 'TV', video: videos[1] },
  { treasure_type: 'Sofa', video: videos[2] }
]
TreasureType.create!(treasure_types)

# Seed data for Posts (addresses for location)
posts = [
  { user_id: User.first.id, location: '123 Smith St', description: 'Great TV in working order at Smith St', council_pickup_date: '2023-09-10' },
  { user_id: User.second.id, location: '456 Locke St', description: 'Comfy reclining sofa available on Locke St', council_pickup_date: '2023-09-15' },
  { user_id: User.third.id, location: '789 Elm St', description: 'Sturdy chair ready for pickup on Elm St', council_pickup_date: '2023-09-17' },
  { user_id: User.fourth.id, location: '101 Maple Ave', description: 'TV stand up for grabs on Maple Ave', council_pickup_date: '2023-09-18' },
  { user_id: User.fifth.id, location: '111 Pine St', description:'Cozy sofa looking for a new home on Pine St', council_pickup_date: '2023-09-25' },
  { user_id: User.fifth.id, location: '222 Oak St', description: 'Learn how to restore furniture in our DIY workshop', council_pickup_date: '2023-09-30' }
]

posts = Post.create!(posts)

# Seed data for Treasures
treasures = [
  { treasure_type_id: TreasureType.first.id, status: true, post_id: Post.first.id, description: 'High-quality chair' },
  { treasure_type_id: TreasureType.second.id, status: true, post_id: Post.second.id, description: 'Fully functional TV' }
]

Treasure.create!(treasures)

# Seed data for Chatrooms
chatroom_names = [
  'Television on Smith St',
  'Reclining Sofa on Locke St',
  'Chair on Elm St',
  'TV Stand on Maple Ave',
  'Sofa on Pine St',
  'DIY Furniture Restoration'
]
chatrooms = chatroom_names.map { |name| { name: name } }
Chatroom.create!(chatrooms)
