class UsersController < ApplicationController
    before_action :require_logged_in, only: [:show]
    before_action :require_logged_out, only: [:new, :create]

    def new
        @user = User.new
        render :new
    end

    def show
        @user = User.find_by(params[:email])
        
        if @user
            render :show
        else
            render :new
        end
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            redirect_to user_url(@user.email)
        else
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:email, :password, :session_token)
    end

end
