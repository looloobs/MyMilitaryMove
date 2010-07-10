class AddToFamilies < ActiveRecord::Migration
  def self.up
    add_column :families, :family_type, :string
    add_column :families, :email, :string
    add_column :families, :birthday, :string
    add_column :families, :service_member, :string
  end

  def self.down
    remove_column :families, :family_type
    remove_column :families, :email
    remove_column :families, :birthday
    remove_column :families, :service_member
  end
end
