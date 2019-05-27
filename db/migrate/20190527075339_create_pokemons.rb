class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :type
      t.string :photo
      t.integer :level
      t.string :address
      t.float :price_per_day
      t.float :rating

      t.timestamps
    end
  end
end
