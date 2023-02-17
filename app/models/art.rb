class Art < ApplicationRecord
  geocoded_by :current_location
  after_validation :geocode, if: :will_save_change_to_current_location?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews

  validates :category, :description, :title, :artist, :year, :current_location, :price, presence: true
  has_many_attached :photos

  include PgSearch::Model

  pg_search_scope :search_by_title_artist_year,
    against: [ :title, :artist, :year ],
    using: {
      tsearch: { prefix: true }
    }
end
