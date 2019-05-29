class AddCoordinatesToPokemon < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :latitude, :float
    add_column :pokemons, :longitude, :float
  end
end
