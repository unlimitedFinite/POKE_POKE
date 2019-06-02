class AddColumnRangeToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :range, :daterange
  end
end
