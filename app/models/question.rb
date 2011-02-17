class Question < ActiveRecord::Base
   has_many :interviews
   has_many :real_estates
   

end
