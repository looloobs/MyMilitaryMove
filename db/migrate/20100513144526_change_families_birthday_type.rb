class ChangeFamiliesBirthdayType < ActiveRecord::Migration
  def self.up
    change_column :families, :birthday, :datetime
  end

  def self.down
    change_column :families, :birthday, :string
  end
end
