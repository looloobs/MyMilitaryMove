class ItinerariesController < ApplicationController
  # GET /itineraries
  # GET /itineraries.xml
  def index
    @move = Move.find(params[:move_id])
    @start = @move.start.installation
    @end = @move.end.installation
    @itineraries = @move.itineraries
    @user = current_user
    @itinerary = Itinerary.new
    trip = @itinerary.trips.build
    if @itineraries.empty?
      render :layout => "form" 
    end
  end

  # GET /itineraries/1
  # GET /itineraries/1.xml
  def show
    @user = current_user
    @itinerary = Itinerary.find(params[:id])
    @move = Move.find(params[:move_id])
    @trips = @itinerary.trips.find(:all, :order => 'date')

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @itinerary }
    end
  end

  # GET /itineraries/new
  # GET /itineraries/new.xml
  def new
    @move = Move.find(params[:move_id])
    @itinerary = Itinerary.new
    trip = @itinerary.trips.build
    
    render :layout => "form" 

  end

  # GET /itineraries/1/edit
  def edit
    @move = Move.find(params[:move_id])
    @itinerary = Itinerary.find(params[:id])
    @trip = @itinerary.trips
      if @trip.blank?
        trip = @itinerary.trips.build
      else
      end
    render :layout => "form"
  end

  # POST /itineraries
  # POST /itineraries.xml
  def create
    @itinerary = Itinerary.new(params[:itinerary])
    @move = Move.find(params[:move_id])
    @user = current_user
    respond_to do |format|
      if @itinerary.save
        flash[:notice] = 'Itinerary was successfully created.'
        format.html { redirect_to move_itinerary_path(@move, @itinerary)}
        format.xml  { render :xml => @itinerary, :status => :created, :location => @itinerary }
      else
        format.html { render :layout => 'form',:action => "index" }
        format.xml  { render :xml => @itinerary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /itineraries/1
  # PUT /itineraries/1.xml
  def update
    @itinerary = Itinerary.find(params[:id])
    @move = Move.find(params[:move_id])
    respond_to do |format|
      if @itinerary.update_attributes(params[:itinerary])
        flash[:notice] = 'Itinerary was successfully updated.'
        format.html { redirect_to move_itinerary_path(@move, @itinerary)}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @itinerary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries/1
  # DELETE /itineraries/1.xml
  def destroy
    @itinerary = Itinerary.find(params[:id])
    @move = Move.find(params[:move_id])
    @itinerary.destroy

    respond_to do |format|
      format.html { redirect_to(itineraries_url) }
      format.xml  { head :ok }
    end
  end
end
