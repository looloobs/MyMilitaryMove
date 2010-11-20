class Community < ActiveRecord::Base
   belongs_to :move
   belongs_to :neighborhood
end
