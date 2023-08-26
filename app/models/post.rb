class Post < ApplicationRecord
  belongs_to :user
  has_many :treasures, dependent: :destroy
  validates :location, presence: true
  has_one :chatroom, dependent: :destroy
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode    #, if: :will_save_change_to_location?


  acts_as_favoritable





  # after_create :create_chatroom

  private

  # def create_chatroom
  #   Chatroom.create(post: self, user: user, name: "Chatroom for Post ##{self.id}")
  # end

end
