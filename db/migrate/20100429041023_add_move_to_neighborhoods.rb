class AddMoveToNeighborhoods < ActiveRecord::Migration
  def self.up
    add_column :neighborhoods, :move_id, :integer
  end

  def self.down
    remove_column :neighborhoods, :move_id
  end
end
