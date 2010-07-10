class AddMoveToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :move_id, :integer
  end

  def self.down
    remove_column :notes, :move_id
  end
end
