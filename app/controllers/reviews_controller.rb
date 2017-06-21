class ReviewsController < ApplicationController
	before_action :set_review, only: [:show, :edit, :update, :destroy]
	before_action :check_owner, only: [:edit, :update, :destroy]

	def index
	end


def new
		@engagement = Engagement.find(params[:engagement_id])
		@review = Review.new
	end

	def create
		@engagement = Engagement.find(params[:engagement_id])
		@review = current_user.reviews.new(review_params)
		@review.engagement_id = params[:engagement_id]
	    if @review.save
	    		if @engagement.offer_id
	     	 		redirect_to offer_engagement_path(@engagement.offer, @engagement)
	     	 	else
	     	 		redirect_to request_engagement_path(@engagement.request, @engagement)
	     	 	end
	    else
	      render template: "reviews/new"
	    end
	end

	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to engagement_review_path
	end

	def show
		@review = Review.find(params[:id])
	end

	def destroy
	end

	private
  def set_review
		@request = Review.find(params[:id])
	end

  def check_owner
    unless @review.user_id == current_user.id
      redirect_to root_path, notice: "You are not allowed to access that page."
    end
  end

  def review_params
    params.require(:review).permit(:description)
  end

end
