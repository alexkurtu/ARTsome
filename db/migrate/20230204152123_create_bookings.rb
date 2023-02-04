class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :offer_date
      t.float :price
      t.integer :rent_type
      t.date :start_date
      t.date :end_date
      t.string :shipping_address
      t.references :user, null: false, foreign_key: true
      t.references :art, null: false, foreign_key: true

      t.timestamps
    end
  end
end
