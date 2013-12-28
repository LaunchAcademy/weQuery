class UserSessionsController < ApplicationController

  def create
    # user = User.from_omniauth(env['omniauth.auth'])
    auth  = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_from_omniauth(auth)
    session[:user_id] = user.id
    if user.admin
      redirect_to dashboard_path, notice: "Signed in."
    else
      redirect_to sessions_path, notice: "Signed in."
    end
    session[:username] = user.anonymizer
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out."
  end

  def invalid
    session[:user_id] = nil
    redirect_to root_path, notice: "Authentication failed, please try again."
  end
end
