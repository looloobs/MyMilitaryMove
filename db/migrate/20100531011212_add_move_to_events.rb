class AddMoveToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :move_id, :integer
  end

  def self.down
    remove_column :events, :move_id
  end
end
