require 'json'
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    require 'pry';binding.pry
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    render :text => "Something went wrong. Why don't you try again?", :status => :bad_request
  end

end
