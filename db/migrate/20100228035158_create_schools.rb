class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.integer :research_id
      t.integer :neighborhood_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :link
      t.string :phone
      t.string :level
      t.integer :family_id

      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end
