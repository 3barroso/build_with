class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :postal_code
      t.string :street_number
      t.string :city
      t.string :state
      t.string :fips_code
      t.string :country

      t.timestamps
    end
  end
end
