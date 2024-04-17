class CreateAdventures < ActiveRecord::Migration[7.1]
  def change
    create_table :adventures do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.integer :shareable
      t.boolean :active
      t.datetime :target_completion

      t.timestamps
    end
  end
end
