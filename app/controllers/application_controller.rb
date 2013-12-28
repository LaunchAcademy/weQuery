require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    if !current_user
      redirect_to root_path, notice: 'You must sign in, first!'
      return false
    else
      return true
    end
  end

  def authenticate_admin!
    if authenticate_user!
      if current_user.admin?
        return true
      else
        redirect_to root_path, alert: 'Access Denied'
        return false
      end
    else
      return false
    end
  end
end
