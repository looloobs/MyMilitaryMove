class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :installation_id
      t.integer :contact_category_id
      t.string :business
      t.string :name
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.text :info
      t.boolean :private

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
