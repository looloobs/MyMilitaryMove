class CreateCons < ActiveRecord::Migration
  def self.up
    create_table :cons do |t|
      t.string :con
      t.integer :negative_id
      t.string :negative_type

      t.timestamps
    end
  end

  def self.down
    drop_table :cons
  end
end
