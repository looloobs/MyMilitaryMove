class StartsController < ApplicationController
  # GET /starts
  # GET /starts.xml
  def index
    @starts = Start.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @starts }
    end
  end

  # GET /starts/1
  # GET /starts/1.xml
  def show
    @start = Start.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @start }
    end
  end

  # GET /starts/new
  # GET /starts/new.xml
  def new
    @start = Start.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @start }
    end
  end

  # GET /starts/1/edit
  def edit
    @start = Start.find(params[:id])
  end

  # POST /starts
  # POST /starts.xml
  def create
    @start = Start.new(params[:start])

    respond_to do |format|
      if @start.save
        flash[:notice] = 'Start was successfully created.'
        format.html { redirect_to(@start) }
        format.xml  { render :xml => @start, :status => :created, :location => @start }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @start.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /starts/1
  # PUT /starts/1.xml
  def update
    @start = Start.find(params[:id])

    respond_to do |format|
      if @start.update_attributes(params[:start])
        flash[:notice] = 'Start was successfully updated.'
        format.html { redirect_to(@start) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @start.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /starts/1
  # DELETE /starts/1.xml
  def destroy
    @start = Start.find(params[:id])
    @start.destroy

    respond_to do |format|
      format.html { redirect_to(starts_url) }
      format.xml  { head :ok }
    end
  end
end
