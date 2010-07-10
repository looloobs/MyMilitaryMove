class CreateFamilies < ActiveRecord::Migration
  def self.up
    create_table :families do |t|
      t.integer :user_id
      t.string :name
      t.name :member
      t.string :age
      t.string :school_level
      t.string :rank
      t.string :branch
      t.boolean :pet
      t.string :pet_type

      t.timestamps
    end
  end

  def self.down
    drop_table :families
  end
end
