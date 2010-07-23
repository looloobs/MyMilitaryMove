class AddMoveToHome < ActiveRecord::Migration
  def self.up
    add_column :homes, :move_id, :integer
  end

  def self.down
    remove_column :homes, :move_id
  end
end
