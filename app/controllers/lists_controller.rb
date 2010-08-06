class ListsController < ApplicationController
  # GET /lists
  # GET /lists.xml
  def index
    @move= Move.find(params[:move_id])
    @lists = @move.lists
    @list = List.new
    @task = Task.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lists }
    end
  end

  # GET /lists/1
  # GET /lists/1.xml
  def show
    @list = List.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @list }
    end
  end

  # GET /lists/new
  # GET /lists/new.xml
  def new
    @list = List.new
    @move= Move.find(params[:move_id])
    @itinerary = @move.itinerary
    render :layout => "form"
  end

  # GET /lists/1/edit
  def edit
    @list = List.find(params[:id])
    @move= Move.find(params[:move_id])
    render :layout => "form"
  end

  # POST /lists
  # POST /lists.xml
  def create
    @list = List.new(params[:list])

    respond_to do |format|
      if @list.save
        format.html { redirect_to :back }
        format.xml  { render :xml => @list, :status => :created, :location => @list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lists/1
  # PUT /lists/1.xml
  def update
    @list = List.find(params[:id])
    @move= @list.move_id
    
    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to move_lists_path(@move) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.xml
  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end
