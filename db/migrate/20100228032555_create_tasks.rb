class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :list_id
      t.string :task
      t.boolean :completed

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
