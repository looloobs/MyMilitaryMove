class CreateStarts < ActiveRecord::Migration
  def self.up
    create_table :starts do |t|
      t.integer :move_id
      t.integer :installation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :starts
  end
end
