class AddLocationTypeToAddress < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :location_type, :integer, null: true
  end
end
