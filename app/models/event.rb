class Event < ActiveRecord::Base
  has_event_calendar
  
  validates_presence_of :name
  validate :end_at_must_be_greater_than_start_at
  
   def end_at_must_be_greater_than_start_at 
     errors.add(:end_at, "must be after start time.") if  
      end_at < start_at 
   end
end