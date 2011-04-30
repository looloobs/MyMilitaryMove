class Installation < ActiveRecord::Base
   has_one :start
   has_one :move, :through => :start
   
   has_one :end
   has_one :move, :through => :end
   
   has_many :neighborhoods
   has_many :installations
   
   has_many :contacts
   has_many :users
   
     /def to_param
       "#{id}-#{name.parameterize}"
     end/ 
     
     def self.search(search)
        if search
          find(:all, :conditions => ['id = ?', "%#{search.id}%"])
        end
     end
end
