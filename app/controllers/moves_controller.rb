class MovesController < ApplicationController
  # GET /moves
  # GET /moves.xml
  def index
    @moves = Move.all
    @itinerary = @move.itinerary
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @moves }
    end
  end

  # GET /moves/1
  # GET /moves/1.xml
  def show
    @move = Move.find(params[:id])
    @user = current_user
    @start = @move.start.installation
    @end = @move.end.installation
    
    @family = @user.families
    @spouse = @user.spouse
    @pets = @user.pets
    @events = @move.events
    @today = Event.find(:all, :conditions => ['move_id = ? AND start_at >= ? AND start_at < ?', @move.id, Date.today, Date.today+1.day], :order => :start_at)
    @tomorrow = Event.find(:all, :conditions => ['move_id = ? AND start_at >= ? AND start_at < ?', @move.id, Date.today + 1.day, Date.today + 2.days], :order => :start_at)
    @nextday = Event.find(:all, :conditions => ['move_id = ? AND start_at >= ? AND start_at < ?', @move.id, Date.today + 2.days, Date.today + 3.days], :order => :start_at)
    @lists = List.find(:all, :conditions => ['move_id = ?', @move])
    @neighborhoods = Neighborhood.find(:all, :conditions => ['move_id = ?', @move])
    @homes = Home.find(:all, :conditions => ['move_id = ?', @move])
    @schools = School.find(:all, :conditions => ['move_id = ?', @move])
  end

  # GET /moves/new
  # GET /moves/new.xml
  def new
    @move = Move.new
    @move.build_start
    @move.build_end
    @move.build_installation
    @user = current_user
    render :layout => "form"
  end

  # GET /moves/1/edit
  def edit
    @move = Move.find(params[:id])
    render :layout => "form"
  end

  # POST /moves
  # POST /moves.xml
  def create
    @move = Move.new(params[:move])

    respond_to do |format|
      if @move.save
        flash[:notice] = 'Move was successfully created.'
        format.html { redirect_to move_path(@move) }
        format.xml  { render :xml => @move, :status => :created, :location => @move }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @move.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /moves/1
  # PUT /moves/1.xml
  def update
    @move = Move.find(params[:id])

    respond_to do |format|
      if @move.update_attributes(params[:move])
        flash[:notice] = 'Move was successfully updated.'
        format.html { redirect_to(@move) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @move.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /moves/1
  # DELETE /moves/1.xml
  def destroy
    @move = Move.find(params[:id])
    @move.destroy

    respond_to do |format|
      format.html { redirect_to(moves_url) }
      format.xml  { head :ok }
    end
  end
end
