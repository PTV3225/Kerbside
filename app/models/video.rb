class Video < ApplicationRecord
  validates :title, presence: true
  has_many :treasure_type
end
