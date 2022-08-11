class RemoveFirtsNameFromSuperpower < ActiveRecord::Migration[6.1]
  def change
    remove_column :superpowers, :first_name, :string
  end
end
