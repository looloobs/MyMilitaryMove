class AddPrivacyToNeighborhoodNotes < ActiveRecord::Migration
  def self.up
    add_column :neighborhood_notes, :privacy, :string
  end

  def self.down
    remove_column :neighborhood_notes, :privacy
  end
end
