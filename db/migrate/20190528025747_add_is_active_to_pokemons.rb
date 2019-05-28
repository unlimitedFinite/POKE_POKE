class AddIsActiveToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :is_active, :boolean, :default => true
  end
end
