class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :art
  has_one :review
  # validates :starts_at, :ends_at, overlap: true
  # validates :status, inclusion: { in: ["Pending renter request", "Pending owner validation", "Confirmed", "Canceled"], allow_nil: true }
  geocoded_by :shipping_address
  after_validation :geocode, if: :will_save_change_to_shipping_address?
end
