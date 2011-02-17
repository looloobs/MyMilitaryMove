class AddRealEstateQuesIdToInterviews < ActiveRecord::Migration
  def self.up
    add_column :interviews, :real_estate_ques_id, :integer
  end

  def self.down
    remove_column :interviews, :real_estate_ques_id
  end
end
