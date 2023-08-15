class Chatroom < ApplicationRecord
  has_many :messages
  has_many :treasures, through: :posts
  belongs_to :post
end
