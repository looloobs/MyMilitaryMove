class NeighborhoodsController < ApplicationController
  # GET /neighborhoods
  # GET /neighborhoods.xml
  def index
    @move= Move.find(params[:move_id])
    @neighborhoods = Neighborhood.find(:all, :conditions => ['move_id = ?', @move.id])
    @pro = Pro.new
    @con = Con.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @neighborhoods }
    end
  end

  # GET /neighborhoods/1
  # GET /neighborhoods/1.xml
  def show
    @neighborhood = Neighborhood.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @neighborhood }
    end
  end

  # GET /neighborhoods/new
  # GET /neighborhoods/new.xml
  def new
    @neighborhood = Neighborhood.new
    @move= Move.find(params[:move_id])
    render :layout => "form"
  end

  # GET /neighborhoods/1/edit
  def edit
    @neighborhood = Neighborhood.find(params[:id])
    @move= Move.find(params[:move_id])
    
    render :layout => "form"
  end

  # POST /neighborhoods
  # POST /neighborhoods.xml
  def create
    @neighborhood = Neighborhood.new(params[:neighborhood])
    @move= Move.find(params[:move_id])
    
    respond_to do |format|
      if @neighborhood.save
        flash[:notice] = 'Neighborhood was successfully created.'
        format.html { redirect_to move_neighborhoods_path(@move) }
        format.xml  { render :xml => @neighborhood, :status => :created, :location => @neighborhood }
      else
        format.html { render :layout => 'form',:action => "new" }
        format.xml  { render :xml => @neighborhood.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /neighborhoods/1
  # PUT /neighborhoods/1.xml
  def update
    @neighborhood = Neighborhood.find(params[:id])
    @move= Move.find(params[:move_id])
    
    respond_to do |format|
      if @neighborhood.update_attributes(params[:neighborhood])
        flash[:notice] = 'Neighborhood was successfully updated.'
        format.html { redirect_to move_neighborhoods_path(@move) }
        format.xml  { head :ok }
      else
        format.html { render :layout => 'form',:action => "edit" }
        format.xml  { render :xml => @neighborhood.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /neighborhoods/1
  # DELETE /neighborhoods/1.xml
  def destroy
    @neighborhood = Neighborhood.find(params[:id])
    @neighborhood.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end
