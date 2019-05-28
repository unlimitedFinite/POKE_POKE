class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = Booking.all
    @pokemons = Pokemon.all
    @user = current_user
    @bookings = policy_scope(Booking)
  end

  def show
  end

  def new
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.pokemon_id = params[:pokemon_id]
    @booking.user_id = current_user[:id]
    @booking.price_paid = ((@booking.end_dt - @booking.start_dt) * @pokemon.price_per_day)
    @booking.save
    if @booking.save
      redirect_to bookings_path
    else
      render 'bookings/show'
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_dt, :end_dt)
  end
end
