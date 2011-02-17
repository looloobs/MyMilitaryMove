class RealEstate < ActiveRecord::Base
   has_many :interviews
   belongs_to :question
end
