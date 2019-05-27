class RenameTypeToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :pokemons, :type, :category
  end
end
