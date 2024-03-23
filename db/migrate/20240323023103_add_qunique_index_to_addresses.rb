class AddQuniqueIndexToAddresses < ActiveRecord::Migration[7.1]
  def change
    add_index :addresses, [:street, :street_number, :city, :state], unique: true
  end
end
