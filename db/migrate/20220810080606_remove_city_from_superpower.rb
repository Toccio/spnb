class RemoveCityFromSuperpower < ActiveRecord::Migration[6.1]
  def change
    remove_column :superpowers, :city, :string
  end
end
