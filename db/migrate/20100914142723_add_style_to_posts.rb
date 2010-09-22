class AddStyleToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :style, :string
  end

  def self.down
    remove_column :posts, :style
  end
end
