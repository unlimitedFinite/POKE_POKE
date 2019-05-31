class Pokemon < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :name, :level, :category, :address, :price_per_day, presence: true
  validates :price_per_day, :rating, numericality: true
  # TODO: Validate photos and ratings?

  def unavailable_dates
    bookings.pluck(:start_dt, :end_dt).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
