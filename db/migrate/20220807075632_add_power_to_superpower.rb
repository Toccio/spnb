class AddPowerToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :power, :string
  end
end
