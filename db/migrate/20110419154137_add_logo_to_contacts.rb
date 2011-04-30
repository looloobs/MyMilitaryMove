class AddLogoToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :logo_file_name, :string
    add_column :contacts, :logo_content_type, :string
    add_column :contacts, :logo_file_size, :integer
    add_column :contacts, :logo_updated_at, :datetime
    add_column :contacts, :coupon, :text
    add_column :contacts, :note, :text
  end

  def self.down
    remove_column :contacts, :note
    remove_column :contacts, :coupon
    remove_column :contacts, :logo_updated_at
    remove_column :contacts, :logo_file_size
    remove_column :contacts, :logo_content_type
    remove_column :contacts, :logo_file_name
  end
end
