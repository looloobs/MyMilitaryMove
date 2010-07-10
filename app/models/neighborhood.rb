class Neighborhood < ActiveRecord::Base
  belongs_to :research
  has_many :homes
  has_many :pros, :as => :positive 
  has_many :cons, :as => :negative
  
  validates_presence_of :name
end
