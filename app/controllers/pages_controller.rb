class PagesController < ApplicationController
	def welcome
		@user = User.new
	end

	def post
	end

	def photos
		@feeds = current_user.get_facebook_feed
	end

	def about
	end

	def help
	end

	def dashboard
	end

	def inbox
	end

	def settings
	end

	def music
		
	end

	def videos
	end

	def search
	end

end