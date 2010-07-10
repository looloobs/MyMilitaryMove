class AddFinishedToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :finished, :boolean
  end

  def self.down
    remove_column :tasks, :finished
  end
end
