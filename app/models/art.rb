class Art < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  #validates :category, :description, title, :picture, :artist, :year, :current_location, presence: true
  has_many_attached :photos
end
