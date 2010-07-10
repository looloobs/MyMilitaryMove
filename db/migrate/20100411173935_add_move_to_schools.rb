class AddMoveToSchools < ActiveRecord::Migration
  def self.up
    add_column :schools, :move_id, :integer
  end

  def self.down
    remove_column :schools, :move_id
  end
end
