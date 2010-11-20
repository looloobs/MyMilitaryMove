class CreateEnds < ActiveRecord::Migration
  def self.up
    create_table :ends do |t|
      t.integer :move_id
      t.integer :installation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ends
  end
end
