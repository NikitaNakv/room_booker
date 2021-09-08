class ChangeDataTypeForBookingStatus < ActiveRecord::Migration[6.1]
  def self.up
    change_table :bookings do |t|
      t.change :status, 'boolean USING CAST(status AS boolean)'
    end
  end
  def self.down
    change_table :bookings do |t|
      t.change :status, :string
    end
  end
end
