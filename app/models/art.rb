class Art < ApplicationRecord
  geocoded_by :current_location
  after_validation :geocode, if: :will_save_change_to_current_location?

  belongs_to :user
  has_many :bookings
  has_many :reviews

  # validates :category, :description, :title, :artist, :year, :current_location, :price, presence: true
  has_one_attached :photo
  after_commit :add_default_cover, on: [:create, :update]

  include PgSearch::Model

  pg_search_scope :search_by_title_artist_year_category,
    against: [ :title, :artist, :year, :category ],
    using: {
      tsearch: { prefix: true }
    }

  private

  def add_default_cover
    unless photo.attached?
      self.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.jpg")), filename: 'default.jpg' , content_type: "image/jpg")
    end
  end
end
