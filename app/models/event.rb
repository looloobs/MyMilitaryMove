class Event < ActiveRecord::Base
  has_event_calendar
  
  validates_presence_of :name
end