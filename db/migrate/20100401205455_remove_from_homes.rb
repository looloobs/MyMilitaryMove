class RemoveFromHomes < ActiveRecord::Migration
  def self.up
    remove_column :homes, :user_id
    remove_column :homes, :move_id
    remove_column :homes, :location
    remove_column :homes, :apartment
  end

  def self.down
  end
end
