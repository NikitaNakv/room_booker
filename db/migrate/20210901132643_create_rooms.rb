class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.integer :capacity
      t.integer :price

      t.timestamps
    end
  end
end
