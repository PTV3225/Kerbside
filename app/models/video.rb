class Video < ApplicationRecord
  validates :title, presence: true
    #PG SEARCH implementation
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:title],
    using: {
      tsearch: { prefix: true }
    }
end
