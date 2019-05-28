require 'open-uri'
require 'json'

class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update, :edit]

  def index
    @pokemons = Pokemon.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.user = current_user

    pokemon_info = get_pokemon_info(@pokemon.name.downcase)
    @pokemon.category = pokemon_info['types'][0]['type']['name']
    @pokemon.save!
    redirect_to pokemon_path(@pokemon)
  end

  def edit
  end

  def update
    @pokemon.update(pokemon_params)
    redirect_to pokemon_path(@pokemon)
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :level, :price_per_day, :address)
  end

  def get_pokemon_info(name)
    url = "https://pokeapi.co/api/v2/pokemon/#{name}"
    # raise
    pokemon_serialized = open(url).read
    return JSON.parse(pokemon_serialized)
  end
end
