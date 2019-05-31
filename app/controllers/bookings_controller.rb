class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def index
    @pokemons = Pokemon.all
    @user = current_user
    @bookings = policy_scope(Booking).order(end_dt: :desc)
  end

  def show
  end

  def update

  end

  def new
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking = Booking.new
    authorize @booking
    @bookings = Booking.all
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
    if @booking.start_dt < Time.now
      redirect_to bookings_path
      flash[:failure] = "Cannot cancel booking after #{@booking.start_dt}."
    elsif @booking.start_dt < Date.yesterday
      redirect_to bookings_path
      flash[:failure] = "Cannot cancel booking with less than 24 hours notice."
    else
      @booking.destroy
      flash[:success] = "Deleted booking."
      redirect_to bookings_path
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_dt, :end_dt)
  end

  def booking_status
    if @booking.start_dt < Time.now
      redirect_to bookings_path
      flash[:failure] = "#{@booking.start_dt} has already passed"
    end
  end

  # def booking_state
  #    if (Time.now > booking.end_dt && !booking.rating)
  #     return "<span class="ml-3 mb-2 badge badge-pill badge-info">= link_to "Leave review!", new_booking_review_path(booking.id) </span>"

  #   # <!-- If booking start date is still upcoming => show upcoming label and 'cancel button' -->
  #    elsif (Time.now < booking.start_dt )
  #     <span class="badge badge-pill badge-warning"> Upcoming!</span>
  #     = link_to 'Cancel', booking_path(booking), method: :delete, data: { confirm: "Are you sure?" }, class:'ml-3 mb-2 badge badge-pill badge-danger'

  #   # <!-- If booking has left a review => show review score -->
  #    elsif (booking.rating)
  #     <span class="stars badge badge-pill">Your rating:
  #        booking.rating.times do
  #         <i class='fas fa-star'></i>
  #        end
  #        (5 - booking.rating).times do
  #         <i class='far fa-star'></i>
  #        end
  #     </span>

  #   # <!-- If Time.now is after start date and before end date => show current label -->
  #    elsif (Time.now > booking.start_dt && Time.now < booking.end_dt)
  #     <span class="badge badge-pill badge-secondary">Ongoing!</span>

  #    end
  # end
end
