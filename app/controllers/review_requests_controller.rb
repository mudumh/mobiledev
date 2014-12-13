class ReviewRequestsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  def new
    @review_request = current_user.review_requests.new
  end
  
  def index
    if params[:filter] == 'All' || params[:filter] == nil
      if params[:query]
        @review_requests = ReviewRequest.text_search(params[:query])
      else
        @review_requests = ReviewRequest.all
      end
    else
       if params[:query]
        @review_requests = ReviewRequest.text_search(params[:query])
      else
        @review_requests = ReviewRequest.where(platform: params[:filter])
      end
      
    end  
    if @review_requests.length == 0 
          flash[:notice] = 'No requests for this platform'
    end
  end
  
  def show
    @review_request = ReviewRequest.find(params[:id])
    @review_response = ReviewResponse.new
  end

  def create

    @review_request = current_user.review_requests.new(review_request_params)
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
