class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user.nil?
            flash.now[:error] = ["Invalid Login"]
            render :new
        elsif user.save
            session[:session_token] = user.reset_session_token!
            redirect_to user_url(user)
        else
            flash.now[:error] = ["Invalid Login"]
            render :new
        end
    end

    def destroy
        user = User.find_by(session_token: session[:session_token])
        user.reset_session_token!
        session[:session_token] = nil
        render :new
    end

    # private

    # def session_params
    #     params.require(:user).permit(:email, :password)
    # end

end