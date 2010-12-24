class Thing < ActiveRecord::Base
   belongs_to :user

   acts_as_polymorphic_paperclip
   

end
