class NotesController < ApplicationController
  # GET /notes
  # GET /notes.xml
  def index
    @move= Move.find(params[:move_id]) 
    @installation = @move.end.installation_id
    @start = @move.start.installation
    @end = @move.end.installation
    @notes = @move.notes
    @note = Note.new
    @move= Move.find(params[:move_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.xml
  def show
    @note = Note.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.xml
  def new
    @note = Note.new
    @move= Move.find(params[:move_id])
    @installation = @move.end.installation_id
    @itinerary = @move.itinerary
    
    render :layout => "form"
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
    @move= Move.find(params[:move_id])
    @installation = @move.end.installation_id
    render :layout => "form"
  end

  # POST /notes
  # POST /notes.xml
  def create
    @move= Move.find(params[:move_id])
    @notes = @move.notes
    @note = Note.new(params[:note])
    @event = Event.new(params[:event])
    @month = Time.now.month
    @year = Time.now.year

    @shown_month = Date.civil(@year, @month)
    @events = @move.events(:order=> :start_at, :limit=> '5')
    @event_strips = @events.event_strips_for_month(@shown_month)

    respond_to do |format|
      if @note.save
        flash[:notice] = 'Note was successfully created.'
        format.html { redirect_to :back }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.xml
  def update
    @note = Note.find(params[:id])
    @move= @note.move_id
    
    respond_to do |format|
      if @note.update_attributes(params[:note])
        flash[:notice] = 'Note was successfully updated.'
        format.html { redirect_to move_notes_path(@move) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.xml
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end
