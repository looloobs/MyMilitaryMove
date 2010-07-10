class AddMembershipDateToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :membership, :datetime
  end

  def self.down
    remove_column :users, :membership
  end
end
