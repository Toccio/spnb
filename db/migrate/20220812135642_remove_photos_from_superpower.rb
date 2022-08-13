class RemovePhotosFromSuperpower < ActiveRecord::Migration[6.1]
  def change
    remove_column :superpowers, :Photos, :string
  end
end
