class UsersController < ApplicationController


	def show
		@user = User.find(params[:id])
		@offers = current_user.offers.all.order("created_at DESC").limit(3)
		@requests = current_user.requests.all.order("created_at DESC").limit(3)
		@engagements = current_user.engagements.all.order("created_at DESC").limit(3)
	end


	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
	end

	private
	def offer_params
    params.require(:offer).permit(:title, :offer_description, :offer_category, :token, :description, :photo)
  end

	def user_params
    params.require(:user).permit(:email, :username, :first_name, :last_name, :gender, :birthday, :avatar, :city, :state, :country)
  end

end
