class User < ApplicationRecord
  has_many :arts
  has_many :bookings
  has_many :reviews
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, :address, :bio, presence: true

end
