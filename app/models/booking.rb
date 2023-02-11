class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :art
  has_one :review
  validates :starts_at, :ends_at, overlap: true
  validates :status, inclusion: { in: ["Pending renter request", "Pending owner validation", "Confirmed", "Canceled"], allow_nil: true }
end
