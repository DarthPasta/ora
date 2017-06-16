class OffersController < ApplicationController
	before_action :set_offer, only: [:show, :edit, :update, :destroy]
	before_action :check_owner, only: [:edit, :update, :destroy]


	def index
		@offers = current_user.offers.order("created_at DESC")#.page(params[:page]) <--- Uncomment this out after we do the paginate gem
	end

	def new
		@offer = Offer.new
	end

	def create
		@offer = current_user.offers.new(offer_params)
	    if @offer.save
	     	 redirect_to offers_path
	    else
	      render template: "offers/new"
	    end
	end

	def edit
		@offer = Offer.find(params[:id])
	end

	def update
		@offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to offers_path
	end

	def show
		@offer = Offer.find(params[:id])
	end

	def destroy
		@offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to requests_path
	end

	private
	def set_offer
		@offer = Offer.find(params[:id])
	end

	def check_owner
    unless @offer.user_id == current_user.id
      redirect_to root_path, notice: "You are not allowed to access that page."
    end
  end

	def offer_params
    params.require(:offer).permit(:title, :offer_description, :offer_category, :token, :description, :photo)
  end

end
