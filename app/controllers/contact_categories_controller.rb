class ContactCategoriesController < ApplicationController
  # GET /contact_categories
  # GET /contact_categories.xml
  def index
    @contact_categories = ContactCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contact_categories }
    end
  end

  # GET /contact_categories/1
  # GET /contact_categories/1.xml
  def show
    @contact_category = ContactCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact_category }
    end
  end

  # GET /contact_categories/new
  # GET /contact_categories/new.xml
  def new
    @contact_category = ContactCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact_category }
    end
  end

  # GET /contact_categories/1/edit
  def edit
    @contact_category = ContactCategory.find(params[:id])
  end

  # POST /contact_categories
  # POST /contact_categories.xml
  def create
    @contact_category = ContactCategory.new(params[:contact_category])

    respond_to do |format|
      if @contact_category.save
        flash[:notice] = 'ContactCategory was successfully created.'
        format.html { redirect_to(@contact_category) }
        format.xml  { render :xml => @contact_category, :status => :created, :location => @contact_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contact_categories/1
  # PUT /contact_categories/1.xml
  def update
    @contact_category = ContactCategory.find(params[:id])

    respond_to do |format|
      if @contact_category.update_attributes(params[:contact_category])
        flash[:notice] = 'ContactCategory was successfully updated.'
        format.html { redirect_to(@contact_category) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_categories/1
  # DELETE /contact_categories/1.xml
  def destroy
    @contact_category = ContactCategory.find(params[:id])
    @contact_category.destroy

    respond_to do |format|
      format.html { redirect_to(contact_categories_url) }
      format.xml  { head :ok }
    end
  end
end
