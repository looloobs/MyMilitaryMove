class CreatePros < ActiveRecord::Migration
  def self.up
    create_table :pros do |t|
      t.string :pro
      t.integer :positive_id
      t.string :positive_type

      t.timestamps
    end
  end

  def self.down
    drop_table :pros
  end
end
