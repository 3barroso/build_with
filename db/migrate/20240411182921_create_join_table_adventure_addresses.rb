# frozen_string_literal: true

# join table between addresses and adventures
class CreateJoinTableAdventureAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :adventure_addresses do |t|
      t.references :address
      t.references :adventure

      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
