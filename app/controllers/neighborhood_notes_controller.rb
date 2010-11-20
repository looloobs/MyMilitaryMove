class NeighborhoodNotesController < ApplicationController
  # GET /neighborhood_notes
  # GET /neighborhood_notes.xml
  def index
    @neighborhood_notes = NeighborhoodNote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @neighborhood_notes }
    end
  end

  # GET /neighborhood_notes/1
  # GET /neighborhood_notes/1.xml
  def show
    @neighborhood_note = NeighborhoodNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @neighborhood_note }
    end
  end

  # GET /neighborhood_notes/new
  # GET /neighborhood_notes/new.xml
  def new
    @neighborhood_note = NeighborhoodNote.new
    @move= Move.find(params[:move_id])
    @neighborhood= Neighborhood.find(params[:neighborhood_id])
       
    render :layout => "form"
  end

  # GET /neighborhood_notes/1/edit
  def edit
    @neighborhood_note = NeighborhoodNote.find(params[:id])
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @move= Move.find(params[:move_id])
    render :layout => "form"
  end

  # POST /neighborhood_notes
  # POST /neighborhood_notes.xml
  def create
    @neighborhood_note = NeighborhoodNote.new(params[:neighborhood_note])
    @move= Move.find(params[:move_id])
    respond_to do |format|
      if @neighborhood_note.save
        flash[:notice] = 'Your Note was successfully created.'
        format.html { redirect_to(move_neighborhoods_path(@move)) }
        format.xml  { render :xml => @neighborhood_note, :status => :created, :location => @neighborhood_note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @neighborhood_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /neighborhood_notes/1
  # PUT /neighborhood_notes/1.xml
  def update
     @move= Move.find(params[:move_id])
    @neighborhood_note = NeighborhoodNote.find(params[:id])
    
    respond_to do |format|
      if @neighborhood_note.update_attributes(params[:neighborhood_note])
        flash[:notice] = 'NeighborhoodNote was successfully updated.'
        format.html { redirect_to move_neighborhoods_path(@move) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @neighborhood_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /neighborhood_notes/1
  # DELETE /neighborhood_notes/1.xml
  def destroy
    @neighborhood_note = NeighborhoodNote.find(params[:id])
    @neighborhood_note.destroy

    respond_to do |format|
      format.html { redirect_to(neighborhood_notes_url) }
      format.xml  { head :ok }
    end
  end
end
