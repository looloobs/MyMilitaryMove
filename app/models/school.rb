class School < ActiveRecord::Base
  belongs_to :research
  has_many :pros, :as => :positive 
  has_many :cons, :as => :negative 
  has_and_belongs_to_many :families
  
  validates_presence_of :name
  validates_url_format_of :link, :allow_blank => 'true'
  validates_presence_of :level
end
