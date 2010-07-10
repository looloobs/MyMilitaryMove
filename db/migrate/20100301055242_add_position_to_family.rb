class AddPositionToFamily < ActiveRecord::Migration
  def self.up
    add_column :families, :position, :string
  end

  def self.down
    remove_column :families, :position
  end
end
