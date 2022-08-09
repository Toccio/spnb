class AddAvatarToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :avatar, :binary
  end
end
