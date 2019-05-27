class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :start_dt
  belongs_to :end_dt
  belongs_to :pokemon
end
