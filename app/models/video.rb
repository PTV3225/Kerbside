class Video < ApplicationRecord
  validates :title, presence: true
  belongs_to :treasure_type
end
