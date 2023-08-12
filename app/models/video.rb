class Video < ApplicationRecord
  has_many :treasure_types
  validates :title, presence: true
end
