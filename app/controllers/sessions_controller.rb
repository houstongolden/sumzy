require 'json'
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.new
    user.from_omniauth(env["omniauth.auth"])
    log_in user
    redirect_to feeds_path, notice: "Signed in!"
  end
  
  def destroy
    log_out
    redirect_to root_path, notice: "Signed out!"
  end

  def failure
    render :text => "Something went wrong. Why don't you try again?", :status => :bad_request
  end

end
