class AllowAdventureEnumsNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :adventures, :status, true
    change_column_null :adventures, :shareable, true
  end
end
