class CreateNeighborhoodNotes < ActiveRecord::Migration
  def self.up
    create_table :neighborhood_notes do |t|
      t.integer :neighborhood_id
      t.integer :move_id
      t.text :note
      t.string :public

      t.timestamps
    end
  end

  def self.down
    drop_table :neighborhood_notes
  end
end
