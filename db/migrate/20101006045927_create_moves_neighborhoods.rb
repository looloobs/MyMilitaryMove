class CreateMovesNeighborhoods < ActiveRecord::Migration
  def self.up
    create_table :moves_neighborhoods do |t|
      t.integer :neighborhood_id
      t.integer :move_id

      t.timestamps
    end
  end

  def self.down
    drop_table :moves_neighborhoods
  end
end
