class OrdersController < ApplicationController
  #include SslRequirement
  #ssl_required :index, :credit
  
  def index
    @orders = Order.all    
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new
    @user = current_user
    render :layout => "form"
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end
  def create
      @order = Order.new(params[:order])
      @user = current_user
      @order.ip_address = request.remote_ip
      if @order.save
         
        if @order.purchase
          
          redirect_to user_path(@user)
        else
          render :action => "failure"
        end
      else
        render :action => 'new', :layout => "form"
      end
    end
  
end
