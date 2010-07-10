class AddPetTypeToPets < ActiveRecord::Migration
  def self.up
    rename_column :pets, :type, :pet_type
  end

  def self.down
    rename_column :pets, :pet_type, :type
  end
end
