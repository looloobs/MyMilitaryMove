class AddFamilyToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :family_id, :integer
  end

  def self.down
    remove_column :lists, :family_id
  end
end
