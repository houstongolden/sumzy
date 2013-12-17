require 'json'
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.new
    user.from_omniauth(env["omniauth.auth"])
    if user.save
      session[:user_id] = user.id
    end
    redirect_to feeds_path, notice: "Signed in!"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    render :text => "Something went wrong. Why don't you try again?", :status => :bad_request
  end

end
