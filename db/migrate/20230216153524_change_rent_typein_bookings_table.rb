class ChangeRentTypeinBookingsTable < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :rent_type, :string
  end
end
