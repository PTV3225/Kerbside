class Treasure < ApplicationRecord
  belongs_to :treasure_type
  belongs_to :post

  has_one_attached :photo

  # validates :status, inclusion: { in: [true, false] }
end
