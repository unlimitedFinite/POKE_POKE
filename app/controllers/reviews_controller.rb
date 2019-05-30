class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @booking = Booking.find(params['booking_id'])
    authorize @review
  end

  def create

    @review = Review.new(review_params)
    @review.booking = Booking.find(params['booking_id'])
    authorize @review
    if @review.save
      redirect_to bookings_path
    else
      raise
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
