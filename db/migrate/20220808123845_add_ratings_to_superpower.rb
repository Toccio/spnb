class AddRatingsToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :ratings, :float
  end
end
