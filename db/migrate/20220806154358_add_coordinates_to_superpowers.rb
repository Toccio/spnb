class AddCoordinatesToSuperpowers < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :latitude, :float
    add_column :superpowers, :longitude, :float
  end
end
