class List < ActiveRecord::Base
  has_many :tasks, :order => 'finished'
  accepts_nested_attributes_for :tasks
end
