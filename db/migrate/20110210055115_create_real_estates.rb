class CreateRealEstates < ActiveRecord::Migration
  def self.up
    create_table :real_estates do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :business
      t.string :background
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :real_estates
  end
end
