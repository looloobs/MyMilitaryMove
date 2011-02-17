class AddRealEstateToInterview < ActiveRecord::Migration
  def self.up
    add_column :interviews, :real_estate_id, :integer
  end

  def self.down
    remove_column :interviews, :real_estate_id
  end
end