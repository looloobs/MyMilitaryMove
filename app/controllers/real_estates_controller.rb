class RealEstatesController < ApplicationController
  # GET /real_estates
  # GET /real_estates.xml
  def index
    @real_estates = RealEstate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @real_estates }
    end
  end

  # GET /real_estates/1
  # GET /real_estates/1.xml
  def show
    @real_estate = RealEstate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @real_estate }
    end
  end

  # GET /real_estates/new
  # GET /real_estates/new.xml
  def new
    @real_estate = RealEstate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @real_estate }
    end
  end

  # GET /real_estates/1/edit
  def edit
    @real_estate = RealEstate.find(params[:id])
  end

  # POST /real_estates
  # POST /real_estates.xml
  def create
    @real_estate = RealEstate.new(params[:real_estate])

    respond_to do |format|
      if @real_estate.save
        flash[:notice] = 'RealEstate was successfully created.'
        format.html { redirect_to(@real_estate) }
        format.xml  { render :xml => @real_estate, :status => :created, :location => @real_estate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @real_estate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /real_estates/1
  # PUT /real_estates/1.xml
  def update
    @real_estate = RealEstate.find(params[:id])

    respond_to do |format|
      if @real_estate.update_attributes(params[:real_estate])
        flash[:notice] = 'RealEstate was successfully updated.'
        format.html { redirect_to(@real_estate) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @real_estate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /real_estates/1
  # DELETE /real_estates/1.xml
  def destroy
    @real_estate = RealEstate.find(params[:id])
    @real_estate.destroy

    respond_to do |format|
      format.html { redirect_to(real_estates_url) }
      format.xml  { head :ok }
    end
  end
end
