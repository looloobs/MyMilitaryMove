class NeighborhoodsController < ApplicationController
  # GET /neighborhoods
  # GET /neighborhoods.xml
  def index
    if current_user.blank?
    @neighborhoods = Neighborhood.all
    else
    @move= Move.find(params[:move_id])
    @neighborhoods = @move.neighborhoods
    @start = @move.start.installation
    @end = @move.end.installation
    @pro = Pro.new
    @con = Con.new
    @finish = @move.end.installation.id
    @all = @end.neighborhoods
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @neighborhoods }
    end
  end

  # GET /neighborhoods/1
  # GET /neighborhoods/1.xml
  def show
    if current_user.blank?
      @neighborhood = Neighborhood.find(params[:id])
    else
      @neighborhood = Neighborhood.find(params[:id])
      @move= Move.find(params[:move_id])
      @community= Community.new
    end
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
    @neighborhood.communities.build
    @neighborhood.neighborhood_notes.build
    render :layout => "form"
  end

  # GET /neighborhoods/1/edit
  def edit
    @neighborhood = Neighborhood.find(params[:id])
    unless current_user.blank?
      @move= Move.find(params[:move_id])
    end
 
    render :layout => "form"
  end

  # POST /neighborhoods
  # POST /neighborhoods.xml
  def create
    @neighborhood = Neighborhood.new(params[:neighborhood])
    #@move= Move.find(params[:move_id])
    
    
    respond_to do |format|
      if @neighborhood.save
        
        if current_user.blank?
        flash[:notice] = 'Thanks! Neighborhood was successfully added. Add another if you like, if not please pass this link long to your friends.'
        format.html { redirect_to installations_path }
        else
        #@move= Move.find(params[:move_id])
        format.html { redirect_to account_url }
        end   
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
    if current_user.blank?
       @neighborhood = Neighborhood.find(params[:id])
    else
       @neighborhood = Neighborhood.find(params[:id])
       @move= Move.find(params[:move_id])
    end
   
    respond_to do |format|
      if @neighborhood.update_attributes(params[:neighborhood])
        flash[:notice] = 'Neighborhood was successfully updated.'
        if current_user.blank? 
           format.html { redirect_to neighborhood_path(@neighborhood) }
        else
           format.html { redirect_to move_neighborhoods_path(@move) }
        end
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
    @move= Move.find(params[:move_id])
    @neighborhood.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
  
  def new_neighborhood 
     @neighborhood = Neighborhood.new
     @installations = Installation.all(:order => 'name')
     @installation = Installation.find(params[:installation_id])
     render :layout => "form"
  end

end
