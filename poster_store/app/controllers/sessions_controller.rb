#Team No:11
#Date of submission: 6/6/2014
#Manages user login sessions
class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to new_order_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
