class AddCityToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :city, :string
  end
end
