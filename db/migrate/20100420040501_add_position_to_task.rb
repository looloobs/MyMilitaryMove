class AddPositionToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :position, :string
  end

  def self.down
    remove_column :tasks, :position
  end
end
