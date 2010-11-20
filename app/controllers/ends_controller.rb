class EndsController < ApplicationController
  # GET /ends
  # GET /ends.xml
  def index
    @ends = End.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ends }
    end
  end

  # GET /ends/1
  # GET /ends/1.xml
  def show
    @end = End.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @end }
    end
  end

  # GET /ends/new
  # GET /ends/new.xml
  def new
    @end = End.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @end }
    end
  end

  # GET /ends/1/edit
  def edit
    @end = End.find(params[:id])
  end

  # POST /ends
  # POST /ends.xml
  def create
    @end = End.new(params[:end])

    respond_to do |format|
      if @end.save
        flash[:notice] = 'End was successfully created.'
        format.html { redirect_to(@end) }
        format.xml  { render :xml => @end, :status => :created, :location => @end }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @end.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ends/1
  # PUT /ends/1.xml
  def update
    @end = End.find(params[:id])

    respond_to do |format|
      if @end.update_attributes(params[:end])
        flash[:notice] = 'End was successfully updated.'
        format.html { redirect_to(@end) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @end.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ends/1
  # DELETE /ends/1.xml
  def destroy
    @end = End.find(params[:id])
    @end.destroy

    respond_to do |format|
      format.html { redirect_to(ends_url) }
      format.xml  { head :ok }
    end
  end
end
