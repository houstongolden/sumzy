class FeedsController < ApplicationController	

	def index
		@facebook_feed = current_user.get_facebook_feed if current_user.facebook_uid.present?
  		@twitter_feed = current_user.get_twitter_feed if current_user.twitter_uid.present? 

	end
	

	private

		def linkify(text)
		newtext = text.gsub(/\b((https?:\/\/|ftps?:\/\/|mailto:|www\.)([A-Za-z0-9\-_=%&@\?\.\/]+))\b/) {
		match = $1
		tail  = $3
			case match
				when /^www/     then  "<a href=\"http://#{match}\">#{match}</a>"
				when /^mailto/  then  "<a href=\"#{match}\">#{tail}</a>"
				else 
				"<a href=\"#{match}\">#{match}</a>"
			end
		}
		newtext
	end


end
