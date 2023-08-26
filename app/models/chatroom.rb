class Chatroom < ApplicationRecord
  has_many :messages

  belongs_to :post

  validates :name, presence: true
end
