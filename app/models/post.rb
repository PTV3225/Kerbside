class Post < ApplicationRecord
  belongs_to :user
  has_many :treasures, dependent: :destroy
  validates :location, presence: true
  has_one :chatroom
  has_many_attached :photos

end
