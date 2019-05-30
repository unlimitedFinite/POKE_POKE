class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @booking = Booking.find(params['booking_id'])
    authorize @review
  end

  def create
    booking = Booking.find(params['booking_id'])
    pokemon = Pokemon.find_by(id: booking.pokemon_id)
    pokemon.rating = params[:review]['rating'].to_i
    pokemon.save
    @review = Review.new(review_params)
    @review.pokemon_id = pokemon.id
    @review.user_id = current_user.id
    @review.booking_id = booking.id
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
