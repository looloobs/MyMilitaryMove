class AddMoveToCons < ActiveRecord::Migration
  def self.up
    add_column :cons, :move_id, :integer
  end

  def self.down
    remove_column :cons, :move_id
  end
end
