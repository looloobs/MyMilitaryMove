class SchoolsController < ApplicationController
  # GET /schools
  # GET /schools.xml
  def index
    @move= Move.find(params[:move_id])
    @installation = @move.end.installation_id
    @start = @move.start.installation
    @end = @move.end.installation
    @schools = School.find(:all, :conditions => ['move_id = ?', @move.id])
    @pro = Pro.new
    @con = Con.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schools }
    end
  end

  # GET /schools/1
  # GET /schools/1.xml
  def show
    @school = School.find(params[:id])
    @move= Move.find(params[:move_id])
    @installation = @move.end.installation_id
    @itinerary = @move.itinerary
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school }
    end
  end

  # GET /schools/new
  # GET /schools/new.xml
  def new
    @school = School.new
    @move= Move.find(params[:move_id])
    @installation = @move.end.installation_id
    @neighborhoods = @move.neighborhoods
    @family = current_user.families
    
    render :layout => "form"
  end

  # GET /schools/1/edit
  def edit
    @school = School.find(params[:id])
    @move= Move.find(params[:move_id])
    @installation = @move.end.installation_id
    @neighborhoods = @move.neighborhoods
    @family = current_user.families
    render :layout => "form"
  end

  # POST /schools
  # POST /schools.xml
  def create
    @school = School.new(params[:school])
    @move= Move.find(params[:move_id])
    @neighborhoods = @move.neighborhoods
    @family = current_user.families
    respond_to do |format|
      if @school.save
        flash[:notice] = 'School was successfully created.'
        format.html { redirect_to move_schools_path(@move) }
        format.xml  { render :xml => @school, :status => :created, :location => @school }
      else
        format.html { render :layout => 'form',:action => "new" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /schools/1
  # PUT /schools/1.xml
  def update
    @school = School.find(params[:id])
    @move= Move.find(params[:move_id])
    @neighborhoods = @move.neighborhoods
    @family = current_user.families
    respond_to do |format|
      if @school.update_attributes(params[:school])
        flash[:notice] = 'School was successfully updated.'
        format.html { redirect_to move_schools_path(@move) }
        format.xml  { head :ok }
      else
        format.html { render :layout => 'form',:action => "edit" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.xml
  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end
