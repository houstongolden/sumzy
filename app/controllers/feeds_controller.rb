class FeedsController < ApplicationController

	def index
		@feeds = current_user.get_facebook_feed
		
	end
	


end
