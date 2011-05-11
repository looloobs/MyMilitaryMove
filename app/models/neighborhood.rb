class Neighborhood < ActiveRecord::Base
  belongs_to :research
  has_many :homes
  has_many :pros, :as => :positive 
  has_many :cons, :as => :negative
  belongs_to :installation
  has_many :communities
  has_many :reviews
  has_many :moves, :through => :communities
  has_many :neighborhood_notes
  accepts_nested_attributes_for :communities
  accepts_nested_attributes_for :neighborhood_notes
  
  validates_presence_of :name 

  
  def to_param
    "#{id}-#{name.parameterize}"
  end
end
