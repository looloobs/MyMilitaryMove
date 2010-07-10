class ConsController < ApplicationController
  # GET /cons
  # GET /cons.xml
  def index
    @cons = Con.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cons }
    end
  end

  # GET /cons/1
  # GET /cons/1.xml
  def show
    @con = Con.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @con }
    end
  end

  # GET /cons/new
  # GET /cons/new.xml
  def new
    @con = Con.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @con }
    end
  end

  # GET /cons/1/edit
  def edit
    @con = Con.find(params[:id])
  end

  # POST /cons
  # POST /cons.xml
  def create
    @con = Con.new(params[:con])

    respond_to do |format|
      if @con.save
        format.html { redirect_to :back}
        format.xml  { render :xml => @con, :status => :created, :location => @con }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @con.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cons/1
  # PUT /cons/1.xml
  def update
    @con = Con.find(params[:id])

    respond_to do |format|
      if @con.update_attributes(params[:con])
        flash[:notice] = 'Con was successfully updated.'
        format.html { redirect_to(@con) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @con.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cons/1
  # DELETE /cons/1.xml
  def destroy
    @con = Con.find(params[:id])
    @con.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end
