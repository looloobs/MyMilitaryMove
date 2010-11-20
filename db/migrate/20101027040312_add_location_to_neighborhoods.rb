class AddLocationToNeighborhoods < ActiveRecord::Migration
  def self.up
    add_column :neighborhoods, :location, :string
    add_column :neighborhoods, :category, :string
    add_column :neighborhoods, :info, :text
  end

  def self.down
    remove_column :neighborhoods, :info
    remove_column :neighborhoods, :category
    remove_column :neighborhoods, :location
  end
end
