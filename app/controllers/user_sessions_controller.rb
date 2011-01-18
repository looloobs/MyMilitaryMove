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
      if @user_session.save
         @user = @user_session.user
        if @user.level == "Basic"
            flash[:notice] = "Login successful!"
            redirect_back_or_default account_url
        elsif @user.level == "Premium" && @user_session.user.order.created_at < 365.days.ago
          redirect_back_or_default account_url
          flash[:notice] = "Looks like your account is past the trial date or yearly membership has ended."
        else @user.level == "Premium" && @user_session.user.order.created_at > 365.days.ago
           redirect_to new_order_path
        end
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
