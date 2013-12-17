class FeedsController < ApplicationController

	def index
		@facebook_feed = current_user.get_facebook_feed if current_user.facebook_uid.present?
    	@twitter_feed = current_user.get_twitter_feed if current_user.twitter_uid.present? 
	end
	


end
