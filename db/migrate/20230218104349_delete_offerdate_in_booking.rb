class DeleteOfferdateInBooking < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :offer_date
  end
end
