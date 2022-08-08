class AddNumberToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :number, :integer
  end
end
