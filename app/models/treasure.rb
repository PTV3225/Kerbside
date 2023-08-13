class Treasure < ApplicationRecord
  belongs_to :treasure_type
  belongs_to :post

  has_many_attached :photos

  validates :status, inclusion: { in: [true, false] }
end
