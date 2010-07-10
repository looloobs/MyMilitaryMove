class Note < ActiveRecord::Base
  acts_as_textiled :note
  
  validates_presence_of :name, :message => "can't be blank"
end
