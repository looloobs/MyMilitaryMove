class CreateApartments < ActiveRecord::Migration
  def self.up
    create_table :apartments do |t|
      t.integer :user_id
      t.integer :move_id
      t.integer :research_id
      t.integer :neighborhood_id
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.string :drive
      t.string :distance
      t.string :school_district
      t.string :price
      t.string :bedrooms
      t.string :bathrooms
      t.string :link
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :apartments
  end
end
