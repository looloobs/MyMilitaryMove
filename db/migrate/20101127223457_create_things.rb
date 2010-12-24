class CreateThings < ActiveRecord::Migration
  def self.up
    create_table :things do |t|
      t.string :name
      t.string :category
      t.string :brand
      t.string :model_number
      t.string :serial_number
      t.datetime :purchase_date
      t.text :info

      t.timestamps
    end
  end

  def self.down
    drop_table :things
  end
end
