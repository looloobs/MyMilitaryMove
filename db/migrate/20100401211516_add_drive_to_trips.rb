class AddDriveToTrips < ActiveRecord::Migration
  def self.up
    add_column :trips, :drive_time, :string
    add_column :trips, :destination_type, :string
  end

  def self.down
    remove_column :trips, :destination_type
    remove_column :trips, :drive_time
  end
end
