class Pokemon < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :level, :category, :price_per_day, presence: true
  validates :price_per_day, :rating, numericality: true

  # TODO: Validate photos and ratings?
end
