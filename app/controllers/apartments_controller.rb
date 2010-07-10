class ApartmentsController < ApplicationController
  # GET /apartments
  # GET /apartments.xml
  def index
    @apartments = Apartment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @apartments }
    end
  end

  # GET /apartments/1
  # GET /apartments/1.xml
  def show
    @apartment = Apartment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @apartment }
    end
  end

  # GET /apartments/new
  # GET /apartments/new.xml
  def new
    @apartment = Apartment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @apartment }
    end
  end

  # GET /apartments/1/edit
  def edit
    @apartment = Apartment.find(params[:id])
  end

  # POST /apartments
  # POST /apartments.xml
  def create
    @apartment = Apartment.new(params[:apartment])

    respond_to do |format|
      if @apartment.save
        flash[:notice] = 'Apartment was successfully created.'
        format.html { redirect_to(@apartment) }
        format.xml  { render :xml => @apartment, :status => :created, :location => @apartment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @apartment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /apartments/1
  # PUT /apartments/1.xml
  def update
    @apartment = Apartment.find(params[:id])

    respond_to do |format|
      if @apartment.update_attributes(params[:apartment])
        flash[:notice] = 'Apartment was successfully updated.'
        format.html { redirect_to(@apartment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @apartment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.xml
  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy

    respond_to do |format|
      format.html { redirect_to(apartments_url) }
      format.xml  { head :ok }
    end
  end
end
