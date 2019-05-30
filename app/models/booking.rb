class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon
  has_one :review
end
