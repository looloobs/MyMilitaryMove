class AddNameToItinerary < ActiveRecord::Migration
  def self.up
    add_column :itineraries, :name, :string
  end

  def self.down
    remove_column :itineraries, :name
  end
end
