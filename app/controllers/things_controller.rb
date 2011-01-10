class ThingsController < ApplicationController
  # GET /things
  # GET /things.xml
  def index
    @user = current_user
    @things = @user.things
    @things.each do |thing|
      @images = thing.assets
    end

    render :layout => "thing"
  end

  # GET /things/1
  # GET /things/1.xml
  def show
    @thing = Thing.find(params[:id])

    render :layout => "thing"
  end

  # GET /things/new
  # GET /things/new.xml
  def new
    @thing = Thing.new
    render :layout => "form"
  end

  # GET /things/1/edit
  def edit
    @thing = Thing.find(params[:id])
    render :layout => "form"
  end

  # POST /things
  # POST /things.xml
  def create
    @thing = Thing.new(params[:thing])
    @thing.user_id = current_user.id
    respond_to do |format|
      if @thing.save

        flash[:notice] = 'Thing was successfully created.'
        format.html { redirect_to user_thing_path(current_user, @thing.id) }
        format.xml  { render :xml => @thing, :status => :created, :location => @thing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /things/1
  # PUT /things/1.xml
  def update
    @thing = Thing.find(params[:id])

    respond_to do |format|
      if @thing.update_attributes(params[:thing])
        flash[:notice] = 'Thing was successfully updated.'
        format.html { redirect_to user_thing_path(current_user, @thing.id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /things/1
  # DELETE /things/1.xml
  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy

    respond_to do |format|
      format.html { redirect_to user_things_path(current_user) }
      format.xml  { head :ok }
    end
  end
  def add_photos
    @thing = Thing.find(params[:thing_id])
    render :layout => "form"
  end
end
