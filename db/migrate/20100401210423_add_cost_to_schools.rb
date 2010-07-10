class AddCostToSchools < ActiveRecord::Migration
  def self.up
    add_column :schools, :school_district, :string
    add_column :schools, :school_type, :string
    add_column :schools, :cost, :string
  end

  def self.down
    remove_column :schools, :cost
    remove_column :schools, :school_type
    remove_column :schools, :school_district
  end
end
