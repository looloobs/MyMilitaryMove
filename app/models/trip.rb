class Trip < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :move
  
  validates_presence_of :to, :from
  validates_numericality_of :cost, :message => 'does not need a dollar sign.', :allow_blank => 'true'
end
