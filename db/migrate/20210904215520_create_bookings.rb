class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :customer_first_name
      t.string :customer_second_name
      t.date :date_in
      t.date :date_out
      t.references :room
      t.string :status

      t.timestamps
    end
  end
end
