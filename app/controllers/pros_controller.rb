class ProsController < ApplicationController
  # GET /pros
  # GET /pros.xml
  def index
    @pros = Pro.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pros }
    end
  end

  # GET /pros/1
  # GET /pros/1.xml
  def show
    @pro = Pro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pro }
    end
  end

  # GET /pros/new
  # GET /pros/new.xml
  def new
    @pro = Pro.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pro }
    end
  end

  # GET /pros/1/edit
  def edit
    @pro = Pro.find(params[:id])
  end

  # POST /pros
  # POST /pros.xml
  def create
    @pro = Pro.new(params[:pro])

    respond_to do |format|
      if @pro.save
        format.html { redirect_to :back }
        format.xml  { render :xml => @pro, :status => :created, :location => @pro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pros/1
  # PUT /pros/1.xml
  def update
    @pro = Pro.find(params[:id])

    respond_to do |format|
      if @pro.update_attributes(params[:pro])
        flash[:notice] = 'Pro was successfully updated.'
        format.html { redirect_to(@pro) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pros/1
  # DELETE /pros/1.xml
  def destroy
    @pro = Pro.find(params[:id])
    @pro.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end
