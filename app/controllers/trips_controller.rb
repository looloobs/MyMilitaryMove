class TripsController < ApplicationController
  # GET /trips
  # GET /trips.xml
  def index
    @trips = Trip.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.xml
  def show
    @trip = Trip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.xml
  def new
    @trip = Trip.new
    @move= Move.find(params[:move_id])
    @itinerary= Itinerary.find(params[:itinerary_id])
    render :layout => "form" 
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
    @move= Move.find(params[:move_id])
    @itinerary= Itinerary.find(params[:itinerary_id])
    render :layout => "form"
  end

  # POST /trips
  # POST /trips.xml
  def create
    @trip = Trip.new(params[:trip])
    @move= Move.find(params[:move_id])
    @itinerary= Itinerary.find(params[:itinerary_id])
    respond_to do |format|
      if @trip.save
        flash[:notice] = 'Trip was successfully created.'
        format.html { redirect_to move_itinerary_path(@move, @itinerary) }
        format.xml  { render :xml => @trip, :status => :created, :location => @trip }
      else
        format.html { render :layout => 'form',:action => "new" }
        format.xml  { render :xml => @trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.xml
  def update
    @trip = Trip.find(params[:id])
    @move= Move.find(params[:move_id])
    @itinerary= Itinerary.find(params[:itinerary_id])
    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        flash[:notice] = 'Trip was successfully updated.'
        format.html { redirect_to move_itinerary_path(@move, @itinerary) }
        format.xml  { head :ok }
      else
        format.html { render :layout => 'form',:action => "edit"}
        format.xml  { render :xml => @trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.xml
  def destroy
    @trip = Trip.find(params[:id])
    @itinerary = Itinerary.find(params[:itinerary_id])
    @move = @itinerary.move
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end
