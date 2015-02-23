class SessionController < ApplicationController
def create
    user = User.where(email: params[:email]).first
    # Session engaged
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    	redirect_to user_path(user)
    else
      flash[:error] = "Login was not sucessful"
      redirect_to 'site#index'
    end
  end

  def destroy
    session[:user_id] = nil

    respond_to do |format|
      format.html { redirect_to '/' }
      format.js   { render js: "window.location.href='/'" }
    end
  end
end
