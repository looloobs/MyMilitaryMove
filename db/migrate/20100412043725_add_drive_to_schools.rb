class AddDriveToSchools < ActiveRecord::Migration
  def self.up
    add_column :schools, :drive, :string
    add_column :schools, :distance, :string
    add_column :schools, :note, :text
  end

  def self.down
    remove_column :schools, :note
    remove_column :schools, :distance
    remove_column :schools, :drive
  end
end
