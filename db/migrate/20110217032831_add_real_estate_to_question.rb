class AddRealEstateToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :real_estate_id, :integer
  end

  def self.down
    remove_column :questions, :real_estate_id
  end
end
