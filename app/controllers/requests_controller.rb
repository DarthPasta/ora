class RequestsController < ApplicationController
	before_action :set_request, only: [:show, :edit, :update, :destroy]
	before_action :check_owner, only: [:edit, :update, :destroy]


	def index
		@requests = current_user.requests.order("created_at DESC")#.page(params[:page]) <--- Uncomment this out after we do the paginate gem
	end

	def new
		@request = Request.new
	end

	def create
		@request = current_user.requests.new(request_params)
	    if @request.save
	     	 redirect_to requests_path
	    else
	      render template: "requests/new"
	    end
	end

	def edit
		@request = Request.find(params[:id])
	end

	def update
		@request = Request.find(params[:id])
    @request.update(request_params)
    redirect_to requests_path
	end

	def show
		@request = Request.find(params[:id])
	end

	def destroy
		@request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path
	end

	private
	def set_request
		@request = Request.find(params[:id])
	end

	def check_owner
    unless @request.user_id == current_user.id
      redirect_to root_path, notice: "You are not allowed to access that page."
    end
  end

	def request_params
    params.require(:request).permit(:title, :request_description, :request_category, :token, :description, :photo)
  end
end
