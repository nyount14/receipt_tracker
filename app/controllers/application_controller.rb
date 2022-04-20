class ApplicationController < ActionController::Base


helper_method :current_user, :logged_in?, :filter
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "Please login first"
            redirect_to login_path
        end
    end

    def filter
        if params[:search]
            @params = params[:search]
        end
    end


end
