class AddPriceToThings < ActiveRecord::Migration
  def self.up
    add_column :things, :price, :string
  end

  def self.down
    remove_column :things, :price
  end
end
