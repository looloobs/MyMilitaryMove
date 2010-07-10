class AddTypeToMove < ActiveRecord::Migration
  def self.up
    add_column :moves, :move_type, :string
  end

  def self.down
    remove_column :moves, :move_type
  end
end
