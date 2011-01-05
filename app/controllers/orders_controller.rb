class OrdersController < ApplicationController
  #include SslRequirement
  #ssl_required :index, :credit
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @orders }
    end
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
    render :layout => "form"
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end
  def create
    @order = Order.new(params[:order])
    @order.ip_address = request.remote_ip
    if @order.save
      if @order.purchase
        render :action => "success"
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end


  
end
