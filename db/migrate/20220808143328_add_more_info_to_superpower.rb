class AddMoreInfoToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :more_info, :text
  end
end
