class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking = Booking.new
  end

  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking = Booking.new(booking_params)
    @booking.pokemon_id = params[:pokemon_id]
    @booking.user_id = [:booking][:user_id]
    @booking.save

    if @booking.save
      redirect_to booking_path(@booking.id)
    else
      render 'bookings/show'
    end
  end

  def destroy
    @booking.delete
    redirect_to bookings_show_path(@booking.id)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_dt, :end_dt)
  end
end
