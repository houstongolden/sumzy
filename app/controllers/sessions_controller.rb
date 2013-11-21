require 'json'
class SessionsController < ApplicationController

  def new
  end

  def create
      user = User.from_omniauth(env["omniauth.auth"])
      logger.info env["omniauth.auth"]
      session[:user_id] = user.id
      redirect_to user_url(user)
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  def failure
    render :text => "Something went wrong. Why don't you try again?", :status => :bad_request
  end

end