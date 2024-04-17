class AddCountyToAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :county, :string
  end
end
