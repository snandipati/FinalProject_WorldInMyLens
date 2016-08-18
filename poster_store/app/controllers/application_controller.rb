#Team No:11
#Date of submission: 6/6/2014

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  # Sets current user session
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
