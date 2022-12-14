class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :superpower, null: false, foreign_key: true
      t.date :check_in
      t.date :check_out
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
