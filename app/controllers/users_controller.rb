class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	respond_to :html

	def new

	end

	def create
	redirect_to @user
	end

	def show
	respond_with(@user)
	end

	def edit
    @user = current_user
  end

	def update
    	@user = current_user
    	if @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :email))
    		redirect_to @user
    	end
	end

	def destroy
	@user.destroy
	respond_with(@user)
	end


	private

	def set_user
	@user = User.find(params[:id])
	end

	def user_params
	params.require(:user).permit(:name,
									:first_name,
									:last_name,
									:email,
									:username,
									:link,
									:image,
									:user_location,
									:uid,
									:provider,
									:oauth_token,
									:oauth_expires_at)
	end
end
