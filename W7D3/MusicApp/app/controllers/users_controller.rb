class UsersController < ApplicationController

    def index
        user = User.all
        render json: user
    end

    def new
        render :new
    end

    def show
        render :show
    end

    def create
        user = User.new(user_params)
        unless user.nil?
            if user.save
                session[:session_token] = user.reset_session_token!
                redirect_to user_url(user)
            else
                flash.now[:error] = "Invalid Login"
                render :new
            end
        end
    end
    

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end