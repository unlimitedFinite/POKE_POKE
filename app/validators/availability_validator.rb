class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    bookings = Booking.where(["pokemon_id =?", record.pokemon_id])
    date_ranges = bookings.map { |b| b.start_dt..b.end_dt }

    date_ranges.each do |range|
      if range.overlaps? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end
