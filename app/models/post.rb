class Post < ApplicationRecord
  belongs_to :user
  has_many :rubbishes, dependent: :destroy
  validates :location, presence: true
end
