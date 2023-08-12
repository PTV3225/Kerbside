class Treasure < ApplicationRecord
  belongs_to :treasure_type
  belongs_to :post

  belongs_to :post
  validates :status, inclusion: { in: [true, false] }

end
