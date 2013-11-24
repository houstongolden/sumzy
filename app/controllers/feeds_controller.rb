class FeedsController < ApplicationController

	def index
		@feeds = current_user.get_feed
	end
	


end
