class AddPhotosToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :photos, :string
  end
end
