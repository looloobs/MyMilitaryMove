class Family < ActiveRecord::Base
  has_and_belongs_to_many :schools
  belongs_to :user
  
  named_scope :spouse, :conditions =>{:family_type => 'Spouse'}
end
