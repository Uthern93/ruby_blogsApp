class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in
    redirect_to login_path, alert: "You have to be logged in to do that." if Current.user.nil?
  end

  def redirect_if_logged_in
    if session[:user_id]
        redirect_to root_path, alert: "You are already logged in!"
    end
  end

end
