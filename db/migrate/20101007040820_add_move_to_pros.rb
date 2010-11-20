class AddMoveToPros < ActiveRecord::Migration
  def self.up
    add_column :pros, :move_id, :integer
  end

  def self.down
    remove_column :pros, :move_id
  end
end
