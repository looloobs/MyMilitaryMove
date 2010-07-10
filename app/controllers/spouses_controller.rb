class SpousesController < ApplicationController
  # GET /spouses
  # GET /spouses.xml
  def index
    @spouses = Spouse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spouses }
    end
  end

  # GET /spouses/1
  # GET /spouses/1.xml
  def show
    @spouse = Spouse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spouse }
    end
  end

  # GET /spouses/new
  # GET /spouses/new.xml
  def new
    @spouse = Spouse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spouse }
    end
  end

  # GET /spouses/1/edit
  def edit
    @spouse = Spouse.find(params[:id])
  end

  # POST /spouses
  # POST /spouses.xml
  def create
    @spouse = Spouse.new(params[:spouse])

    respond_to do |format|
      if @spouse.save
        flash[:notice] = 'Spouse was successfully created.'
        format.html { redirect_to :back }
        format.xml  { render :xml => @spouse, :status => :created, :location => @spouse }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spouse.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spouses/1
  # PUT /spouses/1.xml
  def update
    @spouse = Spouse.find(params[:id])

    respond_to do |format|
      if @spouse.update_attributes(params[:spouse])
        flash[:notice] = 'Spouse was successfully updated.'
        format.html { redirect_to(@spouse) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spouse.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spouses/1
  # DELETE /spouses/1.xml
  def destroy
    @spouse = Spouse.find(params[:id])
    @spouse.destroy

    respond_to do |format|
      format.html { redirect_to(spouses_url) }
      format.xml  { head :ok }
    end
  end
end
