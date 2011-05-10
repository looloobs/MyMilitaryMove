class AddSubmitToNeighborhoods < ActiveRecord::Migration
  def self.up
    add_column :neighborhoods, :submitted_by, :string
    add_column :neighborhoods, :submitted_email, :string
  end

  def self.down
    remove_column :neighborhoods, :submitted_email
    remove_column :neighborhoods, :submitted_by
  end
end
