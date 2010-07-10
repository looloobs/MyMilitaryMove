class RemoveFromNeighborhood < ActiveRecord::Migration
  def self.up
    remove_column :neighborhoods, :user_id
    remove_column :neighborhoods, :move_id
    remove_column :neighborhoods, :pros
    remove_column :neighborhoods, :cons
  end

  def self.down
  end
end
