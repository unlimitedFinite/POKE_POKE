class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon
  belongs_to :review
end
