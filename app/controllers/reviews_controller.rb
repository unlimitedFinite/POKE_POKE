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
      # Change this to an average
      @review.booking.pokemon.rating = @review.rating
      @review.booking.pokemon.save
      respond_to do |format|
        format.html { redirect_to bookings_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'bookings/index' }
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
