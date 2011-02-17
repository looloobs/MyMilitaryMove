class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :to
      t.string :name
      t.integer :interview_id
      t.string :question
      t.string :from
      t.string :sender

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
