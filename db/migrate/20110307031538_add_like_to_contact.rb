class AddLikeToContact < ActiveRecord::Migration
  def self.up
    add_column :contacts, :like, :string
  end

  def self.down
    remove_column :contacts, :like
  end
end
