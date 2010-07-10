class EventsController < ApplicationController
  # GET /events
  # GET /events.xml

  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
    @move= Move.find(params[:move_id])
      @month = params[:month].to_i
      @year = params[:year].to_i

      @shown_month = Date.civil(@year, @month)
      @events = Event.find(:all, :order=> :start_at, :limit=> '5')
      @event_strips = @events.event_strips_for_month(@shown_month)

    render :layout => "calendar"
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    @move= Move.find(params[:move_id])
    @month = Time.now.month
    @year = Time.now.year
    @appointments = Event.find(:all, :conditions => ['move_id = ? AND start_at >= ?', @move.id, DateTime.now], :order => :start_at, :limit=> '5')
    @shown_month = Date.civil(@year, @month)
    @events = @move.events(:order=> :start_at, :limit=> '5')
    @event_strips = @events.event_strips_for_month(@shown_month)
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to :back }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :template => 'calendar/index', :layout => 'calendar'   }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end
