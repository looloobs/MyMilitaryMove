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
        if @user.level == 'Trial'
            @user = @user_session.user
            flash[:notice] = "Login successful!"
            redirect_back_or_default account_url
        elsif @user.created_at > 5.days.ago
          @user = @user_session.user
          flash[:notice] = "Login successful!"
          redirect_back_or_default account_url
        elsif @user.order.created_at > 365.days.ago && @user_session.user.created_at > 365.days.ago
          @user = @user_session.user
          flash[:notice] = "Login successful!"
          redirect_back_or_default account_url
        else 
          redirect_to new_order_path
          flash[:notice] = "Looks like your account is past the trial date or yearly membership has ended."
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
