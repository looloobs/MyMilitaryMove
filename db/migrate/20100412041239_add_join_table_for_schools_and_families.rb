class AddJoinTableForSchoolsAndFamilies < ActiveRecord::Migration
  def self.up 
    create_table :families_schools, :id => false do |t| 
      t.integer :family_id  
      t.integer :school_id  
      end  
  end  
  
  def self.down 
    drop_table :families_schools  
  end 


end
