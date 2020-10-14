class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user = User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def log_in_user!(user)
        user.reset_session_token!
        session[:session_token] = user.session_token
    end

    def ensure_logged_in
        if !logged_in?
            redirect_to new_session_url
        end
    end

end
