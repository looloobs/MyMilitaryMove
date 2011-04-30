class BusinessesController < ApplicationController
   before_filter :require_no_business, :only => [:new, :create]
       before_filter :require_business, :only => [:show, :edit, :update]

       def new
         @business = Business.new
         @contact = Contact.find(params[:contact_id])
         render :layout => "tour"
       end

       def create
         @business = Business.new(params[:business])
         @contact = @business.contact_id
         @business_session = BusinessSession.new
         if @business.save
            #@contact = @business.contact_id
            /@user.deliver_welcome!/
            redirect_to edit_contact_path(@contact)
            /if @user.level == "Premium"
               flash[:notice] = "Account registered!"
               #UserSession.create(@user, false)
               @user.deliver_welcome!
               redirect_to new_order_path
            else 
               @user.deliver_welcome!
               redirect_to new_move_path
            end/
         else
           render :action => :new
         end
       end

       def show
          @business = @current_business
       end

       def edit

       end

       def update

       end
end
