class AddPhotosToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :Photos, :string
  end
end
