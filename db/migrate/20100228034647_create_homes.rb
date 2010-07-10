class CreateHomes < ActiveRecord::Migration
  def self.up
    create_table :homes do |t|
      t.integer :research_id
      t.integer :neighborhood_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :category
      t.string :location
      t.boolean :apartment
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :homes
  end
end
