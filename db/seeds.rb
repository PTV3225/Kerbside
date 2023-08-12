# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Seed data for Users
users = [
  { email: 'user1@example.com', password: 'password', first_name: 'John', last_name: 'Doe' },
  { email: 'user2@example.com', password: 'password', first_name: 'Jane', last_name: 'Smith' },
  # Add more users here
  # Generate 5 more users with names and last names
  { email: 'user3@example.com', password: 'password', first_name: 'Michael', last_name: 'Johnson' },
  { email: 'user4@example.com', password: 'password', first_name: 'Emily', last_name: 'Brown' },
  { email: 'user5@example.com', password: 'password', first_name: 'Daniel', last_name: 'Williams' },
  { email: 'user6@example.com', password: 'password', first_name: 'Olivia', last_name: 'Davis' },
  { email: 'user7@example.com', password: 'password', first_name: 'William', last_name: 'Miller' }
]
User.create!(users)

# Seed data for Admin User
admin_user = User.create!(
  email: 'admin@example.com',
  password: 'adminpassword', # Change this to your desired admin password
  first_name: 'Admin',
  last_name: 'User',

)




videos = [
  { title: 'DIY Chair Restoration' },
  { title: 'Fixing a Broken TV' },
  { title: 'Upcycling Old Sofas' },
  # Add more videos here
]
videos = Video.create!(videos)

treasure_types = [
  { treasure_type: 'Chair', video: videos[0] },
  { treasure_type: 'TV', video: videos[1] },
  { treasure_type: 'Sofa', video: videos[2] },
  # ...
]
TreasureType.create!(treasure_types)

# Seed data for Posts (addresses for location)
posts = [
  { user_id: User.first.id, location: '123 Smith St', description: 'Great TV in working order at Smith St' },
  { user_id: User.second.id, location: '456 Locke St', description: 'Comfy reclining sofa available on Locke St' },
  # Add more posts here
  { user_id: User.third.id, location: '789 Elm St', description: 'Sturdy chair ready for pickup on Elm St' },
  { user_id: User.fourth.id, location: '101 Maple Ave', description: 'TV stand up for grabs on Maple Ave' },
  { user_id: User.fifth.id, location: '111 Pine St', description:'Cozy sofa looking for a new home on Pine St' },
  { user_id: User.fifth.id, location: '222 Oak St', description: 'Learn how to restore furniture in our DIY workshop' }
]
posts = Post.create!(posts)



# Seed data for Treasures
treasures = [
  { treasure_type_id: TreasureType.first.id, status: true, post_id: Post.first.id, description: 'High-quality chair' },
  { treasure_type_id: TreasureType.second.id, status: true, post_id: Post.second.id, description: 'Fully functional TV' },
  # Add more treasures here
]
Treasure.create!(treasures)

# Rest of the user-related seed data remains unchanged


# Seed data for Chatrooms
chatroom_names = [
  'Television on Smith St',
  'Reclining Sofa on Locke St',
  # Add more chatroom names here
  'Chair on Elm St',
  'TV Stand on Maple Ave',
  'Sofa on Pine St',
  'DIY Furniture Restoration'
]
chatrooms = chatroom_names.map { |name| { name: name } }
Chatroom.create!(chatrooms)
