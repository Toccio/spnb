class AddFirstNameToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :first_name, :string
  end
end
