class ProfilesController < ApplicationController
	respond_to :html, :json

  def post_to_social_network
    # if current_user?(@profile.user_id)
      current_user.post params[:post_id] if current_user.facebook_uid.present? 
      current_user.post_on_twitter params[:post_id] if current_user.twitter_uid.present?
    # end
    redirect_to feeds_path
  end

	def index
		@profiles = Profile.all
	end

	def show
		@profile = Profile.find(params[:id])
		@post = Profile.find(params[:id]).microposts.new
	end

	def new
		@profile = Profile.new
	end

	def create
   	@profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render new
   	end
	end

	def edit
		@profile = Profile.find(params[:id])
    if current_user?(@profile.user_id)
      redirect_to profile_path
    else
      redirect_to feeds_path  
    end
	end

	def update
		@profile = Profile.find(params[:id])
    if current_user?(@profile.user_id)
	  	@profile.update(profile_params)
    	redirect_to @profile
    else
      redirect_to feeds_path
    end
	end

	def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_path
	end

  def post
    @profile = Profile.find(params[:id])
  	@profile.microposts.create(post_params)
 		redirect_to @profile
 	end

 	def show_micro
 		@posts = Profile.find(params[:id]).microposts
 		respond_with(@posts)
 	end

  private
	
	def profile_params
		params.require(:profile).permit( :format, :first_name, :last_name, :contact_email, :content, :photo, :facebook_url, :twitter_url, :google_url, :instagram_url, :tumblr_url, :pinterest_url, :soundcloud_url, :youtube_url, :linkedin_url, :bio)
	end

	def post_params
		params.require(:micropost).permit(:content)
	end
end
