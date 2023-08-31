class Treasure < ApplicationRecord
  enum status: {
    available: 0,
    collected: 1,
    pending: 2
  }


  belongs_to :treasure_type
  belongs_to :post

  has_one_attached :photo

  # validates :status, inclusion: { in: [true, false] }
end
