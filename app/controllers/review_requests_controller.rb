class ReviewRequestsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  def new
    @review_request = ReviewRequest.new
  end
  
  def index
    @review_requests = ReviewRequest.all
  end
  
  def show
    @review_request = ReviewRequest.find(params[:id])
    @review_response = ReviewResponse.new
  end

  def create

    @review_request = ReviewRequest.new(review_request_params)
    if @review_request.save
        redirect_to review_requests_path   
    else
      flash[:error] = "Something went wrong"
    end
  end

  private
  
  def review_request_params
    params.require(:review_request).permit(:title,:url,:feedback_request,:platform)
  end


end
