class FeedsController < ApplicationController

	def index
		@feeds = current_user.get_facebook_feed
		@twitter_feeds = current_user.get_twitter_feed
	end
	


end
