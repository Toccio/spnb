class AddQuotesToSuperpower < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :quotes, :text
  end
end
