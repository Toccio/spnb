class AddSuperpowerNameToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :superpower_name, :string
  end
end
