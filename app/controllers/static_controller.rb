class StaticController < ApplicationController
	def homepage
		@offers = Offer.all.order("created_at DESC").limit(20)#.page(params[:page])
		@users = User.all.order("created_at DESC").limit(6)
	end
end
