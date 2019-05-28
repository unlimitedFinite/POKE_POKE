class AddDefaultValueToIsOwnerInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :is_owner, :boolean, :default => false
  end
end
