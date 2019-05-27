class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :price_paid
      t.references :user, foreign_key: true
      t.date :start_dt
      t.date :end_dt
      t.references :pokemon, foreign_key: true

      t.timestamps
    end
  end
end
