class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :art
  # validates :start_date, :end_date, presence: true, availability: true
  # validates :end_date_after_start_date
  # validates :price, :rent_type, :shipping_address, presence: true
  # enum :rent_type, { private_use: 0, events: 1, museums: 2, exhibition: 3, profitable: 4 }

  # private

  # def end_date_after_start_date
  #   return if end_date.blank? || start_date.blank?

  #   errors.add(:end_date, "must be after the start date") if end_date < start_date
end
