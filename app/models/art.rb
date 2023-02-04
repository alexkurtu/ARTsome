class Art < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :category, :title, :content, :picture, :artist, :year, :current_location, presence: true
end
