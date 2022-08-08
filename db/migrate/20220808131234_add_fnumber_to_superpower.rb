class AddFnumberToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :fnumber, :integer
  end
end
