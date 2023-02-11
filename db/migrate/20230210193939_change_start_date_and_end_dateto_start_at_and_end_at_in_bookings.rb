class ChangeStartDateAndEndDatetoStartAtAndEndAtInBookings < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :start_date, :starts_at
    rename_column :bookings, :end_date, :ends_at
  end
end
