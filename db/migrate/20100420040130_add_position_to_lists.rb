class AddPositionToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :position, :string
  end

  def self.down
    remove_column :lists, :position
  end
end
