class BusinessSessionsController < ApplicationController
     before_filter :require_no_business, :only => [:new, :create]
     before_filter :require_business, :only => :destroy

     def new
       @business_session = BusinessSession.new
       @business = Business.new
       @contact = Contact.find(params[:contact_id])
       render :layout => "tour"
     end

     def create
       @contact = find(params[:contact_id])
       @business = Business.new
       @business_session = BusinessSession.new(params[:business_session])
       @business = @business_session.business
       if @business_session.save
         flash[:notice] = "Login successful!"
         redirect_to :back
       else
         render :action => :new
       end
     end

     def destroy
       current_business_session.destroy
       flash[:notice] = "Logout successful!"
       redirect_back_or_default new_business_session_url
     end
end
