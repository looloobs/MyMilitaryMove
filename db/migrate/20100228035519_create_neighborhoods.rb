class CreateNeighborhoods < ActiveRecord::Migration
  def self.up
    create_table :neighborhoods do |t|
      t.integer :research_id
      t.string :name
      t.string :distance
      t.string :drive_distance
      t.string :school_district
      t.text :pros
      t.text :cons
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :neighborhoods
  end
end
