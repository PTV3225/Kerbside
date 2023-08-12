# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Seed data for RubbishTypes (types of street rubbish)
rubbish_types = [
  { title: 'Chair' },
  { title: 'TV' },
  { title: 'Sofa' },
  # Add more rubbish types here
]

RubbishType.create!(rubbish_types)

# Seed data for Videos (DIY videos)
videos = [
  { title: 'DIY Chair Restoration' },
  { title: 'Fixing a Broken TV' },
  { title: 'Upcycling Old Sofas' },
  # Add more videos here
]

Video.create!(videos)

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
  admin: true
)

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

# Seed data for Posts (addresses for location)
posts = [
  { user_id: User.first.id, location: '123 Smith St', content: 'Great TV in working order at Smith St' },
  { user_id: User.second.id, location: '456 Locke St', content: 'Comfy reclining sofa available on Locke St' },
  # Add more posts here
  { user_id: User.third.id, location: '789 Elm St', content: 'Sturdy chair ready for pickup on Elm St' },
  { user_id: User.fourth.id, location: '101 Maple Ave', content: 'TV stand up for grabs on Maple Ave' },
  { user_id: User.fifth.id, location: '111 Pine St', content: 'Cozy sofa looking for a new home on Pine St' },
  { user_id: User.fifth.id, location: '222 Oak St', content: 'Learn how to restore furniture in our DIY workshop' }
]

Post.create!(posts)
