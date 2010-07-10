class Home < ActiveRecord::Base
  belongs_to :research
  belongs_to :neighborhood
  has_many :pros, :as => :positive 
  has_many :cons, :as => :negative
  attr_accessor :new_neighborhood_name
  before_save :create_neighborhood_from_name
  
  def create_neighborhood_from_name
    create_neighborhood(:name => new_neighborhood_name) unless new_neighborhood_name.blank?
  end
  
  validates_presence_of :address, :city, :state, :zip
  validates_url_format_of :link, :allow_blank => 'true'
end
