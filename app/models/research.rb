class Research < ActiveRecord::Base
  has_many :homes
  has_many :schools
  has_many :neighborhoods
  belongs_to :move
end
