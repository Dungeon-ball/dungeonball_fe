class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
