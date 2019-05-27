class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def index
  end

  def show
  end

  def new
    Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to bookings_show_path(@booking.id)
    else
      render :new
  end

  def destroy
    @booking.delete
    redirect_to bookings_show_path(@booking.id)
  end

  private

  def all_bookings
    @bookings.all
  end

  def set_booking
    @booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_dt, :end_dt, :price_paid)
  end
end
