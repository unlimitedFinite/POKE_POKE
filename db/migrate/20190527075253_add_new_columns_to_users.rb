class AddNewColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :dob, :date
    add_column :users, :phone_number, :string
    add_column :users, :gender, :string
    add_column :users, :profile_photo, :string
    add_column :users, :is_owner, :boolean
    add_column :users, :rating, :integer
  end
end
