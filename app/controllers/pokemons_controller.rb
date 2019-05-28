class PokemonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]

  def index
    @pokemons = policy_scope(Pokemon)
    authorize @pokemon
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @booking = Booking.new
    authorize @pokemon
  end
end
