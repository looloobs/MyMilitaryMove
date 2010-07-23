class Itinerary < ActiveRecord::Base
  has_many :trips, :dependent => :destroy
  belongs_to :move
  accepts_nested_attributes_for :trips
  
  validates_presence_of :name
  
end
