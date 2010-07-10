class RemoveFromFamilies < ActiveRecord::Migration
  def self.up
    remove_column :families, :age
    remove_column :families, :rank
    remove_column :families, :brand
    remove_column :families, :pet
    remove_column :families, :pet_type
  end

  def self.down
  end
end
