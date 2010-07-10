class CreateMoves < ActiveRecord::Migration
  def self.up
    create_table :moves do |t|
      t.integer :user_id
      t.string :to
      t.string :from
      t.datetime :date
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :moves
  end
end
