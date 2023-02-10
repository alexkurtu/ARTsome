class ChangePriceToValueInBookings < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :price, :value
  end
end
