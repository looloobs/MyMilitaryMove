class HomesController < ApplicationController
  # GET /homes
  # GET /homes.xml
  def index
    @move= Move.find(params[:move_id])
    @homes = Home.find(:all, :conditions => ['move_id = ?', @move.id])
    @pro = Pro.new
    @con = Con.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @homes }
    end
  end

  # GET /homes/1
  # GET /homes/1.xml
  def show
    @home = Home.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @home }
    end
  end

  # GET /homes/new
  # GET /homes/new.xml
  def new
    @home = Home.new
    @move= Move.find(params[:move_id])
    @neighborhoods = @move.neighborhoods
    render :layout => "form"
  end

  # GET /homes/1/edit
  def edit
    @home = Home.find(params[:id])
    @move= Move.find(params[:move_id])
    @neighborhoods = @move.neighborhoods
    render :layout => "form"
  end

  # POST /homes
  # POST /homes.xml
  def create
    @home = Home.new(params[:home])
    @move= Move.find(params[:move_id])
    @home.move_id = @move.id
    @neighborhoods = @move.neighborhoods

    respond_to do |format|
      if @home.save
        format.html { redirect_to move_homes_path(@move) }
        format.xml  { render :xml => @home, :status => :created, :location => @home }
      else
        format.html { render :layout => 'form',:action => "new" }
        format.xml  { render :xml => @home.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /homes/1
  # PUT /homes/1.xml
  def update
    @home = Home.find(params[:id])
    @move= Move.find(params[:move_id])
    @neighborhoods = @move.neighborhoods
    
    respond_to do |format|
      if @home.update_attributes(params[:home])
        flash[:notice] = 'Home was successfully updated.'
        format.html { redirect_to move_homes_path(@move) }
        format.xml  { head :ok }
      else
        format.html { render :layout => 'form',:action => "edit" }
        format.xml  { render :xml => @home.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.xml
  def destroy
    @home = Home.find(params[:id])
    @home.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end
