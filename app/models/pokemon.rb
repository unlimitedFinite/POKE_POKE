class Pokemon < ApplicationRecord
  include AlgoliaSearch

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings

  validates :name, :level, :category, :address, :price_per_day, presence: true
  validates :price_per_day, :rating, numericality: true

  algoliasearch do
    searchableAttributes ['name']

    attributesForFaceting ['searchable(price_per_day)', 'searchable(address)', 'searchable(rating)', :name]
  end

  # TODO: Validate photos and ratings?
end
