require 'open-uri'
require 'json'

class PokemonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_pokemon, only: [:show, :update, :edit, :deactivate, :reactivate]

  def index
    if params[:query].present?
      @pokemons = policy_scope(Pokemon).search_by_name(params[:query])
    else
      @pokemons = policy_scope(Pokemon)
    end

    @markers = @pokemons.map do |selected|
      pokemon_category = get_pokemon_category(selected.price_per_day)

      {
        lat: selected.latitude,
        lng: selected.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { selected: selected }),
        category: pokemon_category,
        flag: true
      }
    end
  end

  def inventory
    @user = current_user
    @pokemons = Pokemon.where(user: @user)
      .left_joins(:bookings)
      .group(:id)
      .order('COUNT(bookings.id) DESC')
    authorize @pokemons
  end

  def show
    @booking = Booking.new

    pokemon_category = get_pokemon_category(@pokemon.price_per_day)

    @markers = [{ lat: @pokemon.latitude, lng: @pokemon.longitude, category: pokemon_category }]
  end

  def new
    @pokemon = Pokemon.new
    @names = get_names
    authorize @pokemon
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.user = current_user
    authorize @pokemon

    pokemon_info = get_pokemon_info(@pokemon.name.downcase)
    @pokemon.category = pokemon_info['types'][0]['type']['name']
    @pokemon.photo = pokemon_info['sprites']['front_default']

    if @pokemon.save
      @pokemon.user.is_owner = true
      @pokemon.user.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  def edit
    @names = get_names
  end

  def update
    if @pokemon.update(pokemon_params)
      redirect_to pokemon_path(@pokemon)
    else
      render :edit
    end
  end

  def deactivate
    @pokemon.is_active = false
    @pokemon.save
    flash[:success] = "#{@pokemon.name} is deactivated."
    redirect_to pokemon_path(@pokemon)
  end

  def reactivate
    @pokemon.is_active = true
    @pokemon.save
    flash[:success] = "#{@pokemon.name} is activated!"
    redirect_to pokemon_path(@pokemon)
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
    authorize @pokemon
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :level, :price_per_day, :address)
  end

  def get_names
    names = []
    url = 'https://pokeapi.co/api/v2/pokemon?limit=20'
    json = open(url).read
    data = JSON.parse(json)['results']
    data.each do |result|
      names << result['name']
    end
    return names
  end

  def get_pokemon_info(name)
    url = "https://pokeapi.co/api/v2/pokemon/#{name}"
    # raise
    pokemon_serialized = open(url).read
    return JSON.parse(pokemon_serialized)
  end

  def get_pokemon_category(price_per_day)
    if price_per_day > 40
      return 'expensive'
    elsif price_per_day > 25
      return 'moderate'
    else
      return 'cheap'
    end
  end
end
