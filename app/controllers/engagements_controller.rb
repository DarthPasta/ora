class EngagementsController < ApplicationController

	def index
		@engagement = Engagement.find(params[:id])
	end

	def new
		@engagement = Engagement.new
	end

	def create 
		@offer = Offer.find(params[:offer_id])
		@request = Request.find(params[:request_id])

		e = Engagement.new
		e.user_id = current_user.id
		
		if @offer		
			e.offer_id = params[:offer_id]
			e.save
			flash[:notice] = "Successful"
			# redirect_to root_path
			redirect_to offer_engagement_path(@offer, e)
		elsif @request
			e.request_id = params[:request_id]
			e.save
			flash[:notice] = "Successful"
			# redirect_to root_path
			redirect_to request_engagement_path(@request, e)
		end

	end

	def show
		@engagement = Engagement.find(params[:id])
	end

end
