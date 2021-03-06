# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :card_number, :card_verification
  helper_method :current_user_session, :current_user
  helper_method :current_business_session, :current_business
  filter_parameter_logging :password, :password_confirmation
  before_filter :set_timezone


  
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end
 
    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    def set_timezone
      # current_user.time_zone #=> 'London'
      Time.zone = "Central Time (US & Canada)"
    end

          def current_business_session
            return @current_business_session if defined?(@current_business_session)
            @current_business_session = BusinessSession.find
          end

          def current_business
            return @current_business if defined?(@current_business)
            @current_business = current_business_session && current_business_session.business
          end
          def require_business
            unless current_business
              store_location
              flash[:notice] = "You must be logged in to access this page"
              redirect_to new_business_session_url
              return false
            end
          end

          def require_no_business
            if current_business
              store_location
              flash[:notice] = "You must be logged out to access this page"
              redirect_to account_url
              return false
            end
          end
    
end
