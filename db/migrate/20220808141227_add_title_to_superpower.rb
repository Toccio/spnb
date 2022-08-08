class AddTitleToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :title, :string
  end
end
