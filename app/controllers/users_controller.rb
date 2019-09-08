class UsersController < ApplicationController
before_action :find_current_user, only: [:show, :edit, :update, :destroy]
before_action :require_login
skip_before_action :require_login, only: [:new, :create]

    def show

    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        return redirect_to new_user_path unless @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def edit

    end

    def update

    end

    def destroy
        @user.delete
    end

    private

    def find_current_user
        @user = User.find(params[:id])
    end

    def require_login
        redirect_to new_session_path unless session.include? :user_id
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
