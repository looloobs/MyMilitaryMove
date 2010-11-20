class AddInstallationToNeighborhoods < ActiveRecord::Migration
  def self.up
    add_column :neighborhoods, :installation_id, :integer
  end

  def self.down
    remove_column :neighborhoods, :installation_id
  end
end
