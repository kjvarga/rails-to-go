# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  #helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user

  #before_filter :touch_restart
  
  private
    def touch_restart; system("touch #{Rails.root}/tmp/restart.txt"); end
    
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end

  #
  # Dynamically add:
  #   account type restriction methods: require_admin_user, require_admin_or_author_user etc
  #
  def method_missing(method_id, *arguments)
    if match = /^require_(\w+)_user$/.match(method_id.to_s)
      unless current_user and current_user.send("is_#{match[1]}_type?")
        store_location
        flash[:notice] = "You do not have privileges to access this page"
        redirect_to root_url
        return false
      end
    else
      super
    end
  end
  
    def require_admin_user

    end

    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to login_url
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
end
