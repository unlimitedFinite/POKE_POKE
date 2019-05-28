class AddDefaultRatingToPokemons < ActiveRecord::Migration[5.2]
  def change
    change_column :pokemons, :rating, :integer, :default => false
  end
end
