class CreateResearches < ActiveRecord::Migration
  def self.up
    create_table :researches do |t|
      t.integer :user_id
      t.integer :move_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :researches
  end
end
