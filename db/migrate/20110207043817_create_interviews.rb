class CreateInterviews < ActiveRecord::Migration
  def self.up
    create_table :interviews do |t|
      t.integer :installation_id
      t.string :name
      t.string :phone
      t.string :email
      t.string :business
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :interviews
  end
end
