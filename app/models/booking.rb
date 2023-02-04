class Booking < ApplicationRecord
  belongs_to :user
  belong_to :art
  validates :price, :rent_type, :start_date, :end_date, :shipping_address, presence: true
  enum :rent_type, { private_use: 0, events: 1, museums: 2, exhibition: 3, profitable: 4 }
end
