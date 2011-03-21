class CalendarController < ApplicationController
  
  def index
    @move= Move.find(params[:move])
    @installation = @move.end.installation_id
    @month = params[:month].to_i
    @year = params[:year].to_i

    @appointments = Event.find(:all, :conditions => ['move_id = ? AND start_at >= ?', @move.id, DateTime.now], :order => :start_at, :limit=> '5')

    @shown_month = Date.civil(@year, @month)
    start_d, end_d = Event.get_start_and_end_dates(@shown_month) # optionally pass in @first_day_of_week
    @events = @move.events.events_for_date_range(start_d, end_d)
    @event_strips = Event.create_event_strips(start_d, end_d, @events)

    @event = Event.new

    render :layout => "calendar"
  end
  
end