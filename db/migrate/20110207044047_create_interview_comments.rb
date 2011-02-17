class CreateInterviewComments < ActiveRecord::Migration
  def self.up
    create_table :interview_comments do |t|
      t.integer :interview_id
      t.string :comment
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :interview_comments
  end
end
