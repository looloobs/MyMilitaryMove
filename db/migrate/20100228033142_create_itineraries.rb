class CreateItineraries < ActiveRecord::Migration
  def self.up
    create_table :itineraries do |t|
      t.integer :user_id
      t.integer :move_id

      t.timestamps
    end
  end

  def self.down
    drop_table :itineraries
  end
end
