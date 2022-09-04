class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :person
      t.integer :price
      t.string :name
      t.text :introduce
      t.integer :total_price
      t.integer :total_person

      t.timestamps
    end
  end
end
