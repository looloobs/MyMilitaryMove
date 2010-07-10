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
    @spouse = Family.find(:all, :conditions=> ["family_type = ? AND user_id = ?", "Spouse", @user.id])
    @children = Family.find(:all, :conditions=> ["family_type = ? AND user_id = ?", "Child", @user.id])
    @pets = @user.pets
    
  end

  # GET /moves/new
  # GET /moves/new.xml
  def new
    @move = Move.new
    @user = current_user
    render :layout => "form"
  end

  # GET /moves/1/edit
  def edit
    @move = Move.find(params[:id])
  end

  # POST /moves
  # POST /moves.xml
  def create
    @move = Move.new(params[:move])

    respond_to do |format|
      if @move.save
        flash[:notice] = 'Move was successfully created.'
        format.html { redirect_to user_path(current_user) }
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
