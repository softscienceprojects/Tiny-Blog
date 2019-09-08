class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    helper_method :user_id

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            #flash 
            redirect_to new_sessions_path
        end
    end
end
