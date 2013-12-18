class WelcomeController < ApplicationController

  def index
    redirect_to feeds_path if logged_in? 
  end

	def profile
	end

end
