class Move < ActiveRecord::Base
  belongs_to :users
  has_many :researches
  has_many :itineraries
  has_many :trips
  has_many :families
  has_many :neighborhoods
  has_many :events
  
  accepts_nested_attributes_for :itineraries
end
