class AddActiveToMoves < ActiveRecord::Migration
  def self.up
    add_column :moves, :active, :string
  end

  def self.down
    remove_column :moves, :active
  end
end
