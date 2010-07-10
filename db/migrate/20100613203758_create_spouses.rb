class CreateSpouses < ActiveRecord::Migration
  def self.up
    create_table :spouses do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :branch
      t.string :rank
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :spouses
  end
end
