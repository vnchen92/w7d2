class SessionsController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in, only: [:destroy]


    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] = ["Invalid credentials"]
            render :new
        end
    end

    def destroy
        logged_out!
        redirect_to new_session_url
    end
end
