class AddCountyToHomes < ActiveRecord::Migration
  def self.up
    add_column :homes, :county, :string
    add_column :homes, :drive, :string
    add_column :homes, :distance, :string
    add_column :homes, :school_district, :string
    add_column :homes, :price, :string
    add_column :homes, :bedrooms, :string
    add_column :homes, :bathrooms, :string
    add_column :homes, :note, :text
  end

  def self.down
    remove_column :homes, :note
    remove_column :homes, :bathrooms
    remove_column :homes, :bedrooms
    remove_column :homes, :price
    remove_column :homes, :school_district
    remove_column :homes, :distance
    remove_column :homes, :drive
    remove_column :homes, :county
  end
end
