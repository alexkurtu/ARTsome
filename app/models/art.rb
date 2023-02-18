class Art < ApplicationRecord
  geocoded_by :current_location
  after_validation :geocode, if: :will_save_change_to_current_location?

  belongs_to :user
  has_many :bookings
  has_many :reviews

  # validates :category, :description, :title, :artist, :year, :current_location, :price, presence: true
  has_one_attached :photo

  include PgSearch::Model

  pg_search_scope :search_by_title_artist_year_category,
    against: [ :title, :artist, :year, :category ],
    using: {
      tsearch: { prefix: true }
    }
end
