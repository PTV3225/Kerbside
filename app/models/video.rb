class Video < ApplicationRecord
  validates :title, presence: true
    #PG SEARCH implementation
  validates :title, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:title],
    using: {
      tsearch: { prefix: true }
    }
end
