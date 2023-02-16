class Art < ApplicationRecord
  geocoded_by :current_location
  # after_validatiobn :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :category, :description, :title, :artist, :year, :current_location, :price, presence: true
  has_many_attached :photos
end
