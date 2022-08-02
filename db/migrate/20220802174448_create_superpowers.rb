class CreateSuperpowers < ActiveRecord::Migration[6.1]
  def change
    create_table :superpowers do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.text :description
      t.string :address

      t.timestamps
    end
  end
end
