class Move < ActiveRecord::Base
  belongs_to :users
  has_many :researches
  has_many :itineraries
  has_many :trips
  has_many :families
  has_many :communities
  has_many :neighborhoods, :through => :communities
  accepts_nested_attributes_for :communities
  
  has_many :events
  has_many :lists
  has_many :notes
  accepts_nested_attributes_for :itineraries
  
  has_one :start
  has_one :installation, :through => :start 
  accepts_nested_attributes_for :start
  
  has_one :installation
  accepts_nested_attributes_for :installation
  
  has_one :end
  has_one :installation, :through => :end 
  
  accepts_nested_attributes_for :end
  
end
