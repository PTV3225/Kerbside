class Rubbish < ApplicationRecord
  belongs_to :rubbish_type
  belongs_to :post

  belongs_to :post
  validates :status, inclusion: { in: [true, false] }

end
