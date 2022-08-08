class AddRatingToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :rating, :integer
  end
end
