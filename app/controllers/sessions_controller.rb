class SessionsController < ApplicationController

    def new
        
    end

    def create
        @user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
        return redirect_to new_session_path unless !!@user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def destroy
        session.delete(:user_id) 
        redirect_to new_session_path
    end


end
