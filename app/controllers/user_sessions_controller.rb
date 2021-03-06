class UserSessionsController < ApplicationController
    before_filter :require_no_user, :only => [:new, :create]
    before_filter :require_user, :only => :destroy

    def new
      @user_session = UserSession.new
      @user = User.new
      
      render :layout => "user_sessions_new"
    end

    def create
      @user_session = UserSession.new(params[:user_session])
      @user = User.new
      #@user = @user_session.user
      if @user_session.save
         @user = @user_session.user
         redirect_to account_url
        /if @user.level == "Basic" and @user.created_at > 7.days.ago
            flash[:notice] = "Login successful!"
            redirect_to account_url
        elsif @user.level == "Basic" and @user.created_at < 7.days.ago and @user.order.nil?
            redirect_to new_order_path
            flash[:notice] = "Looks like your account is past the trial date or yearly membership has ended."
        elsif @user.level == "Premium" and @user.order.created_at > 365.days.ago
           redirect_to account_url
        elsif @user.level == "Premium" and @user.order.nil?
           redirect_to new_order_path
           flash[:notice] = "Looks like your account is past the trial date or yearly membership has ended." 
        else 
           redirect_to new_order_path
        end/
      else
       render :layout => 'user_sessions_new', :action => "new"
      end
    end

    def destroy
      current_user_session.destroy
      flash[:notice] = "Logout successful!"
      redirect_to root_url
    end
end
