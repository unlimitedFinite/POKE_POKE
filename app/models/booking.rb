require_relative '../validators/availability_validator.rb'
class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon
  has_one :review

  validates :start_dt, :end_dt, presence: true
  validates :range, presence: true, availability: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_dt.blank? || start_dt.blank?

    if end_dt < start_dt
      errors.add(:end_dt, "must be after the start date")
    end
  end
end
