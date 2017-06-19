class EngagementsController < ApplicationController

	def index
		@engagement = Engagement.find(params[:id])
	end

	def new
		@engagement = Engagement.new
	end

	def create
		e = Engagement.new
			e.user_id = current_user.id
			e.offer_id = params[:offer_id]
		e.save

			flash[:notice] = "Successful"
			redirect_to root_path
	end

	def show
		@engagement = Engagement.find(params[:id])
	end

end
