class AddUserToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :user_id, :integer
  end

  def self.down
    remove_column :orders, :user_id
  end
end
