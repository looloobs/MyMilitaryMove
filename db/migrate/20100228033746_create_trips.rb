class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.integer :itinerary_id
      t.string :to
      t.string :from
      t.datetime :date
      t.string :transportation
      t.string :destination_name
      t.string :address
      t.string :state
      t.string :city
      t.integer :zip
      t.string :phone
      t.string :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
