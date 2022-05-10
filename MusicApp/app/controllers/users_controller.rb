class UsersController < ApplicationController
    before_action :require_logged_in, only: [:show]
    before_action :require_logged_out, only: [:new, :create]

    def new
        @user = User.new
        render :new
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            flash[:success] = ["Successful creation!"]
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:email, :password, :session_token)
    end

end
