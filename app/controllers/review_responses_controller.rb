class ReviewResponsesController < ApplicationController
  before_action :set_review_request
  before_filter :authenticate_user!
  def new

  
  end
  
  def create
    @review_response = @review_request.review_responses.new(review_response_params)
    if @review_response.save
    redirect_to review_request_path(@review_request, anchor: "review_response_#{@review_response.id}"), notice: "Successfully posted!"
    else

    end

  end

  private 

  def review_response_params
    params.require(:review_response).permit(:feedback,:responsiveness,:easeofuse,:innovativeness,:functionality,:aesthetics)
  end
  
  def set_review_request

    @review_request = ReviewRequest.find(params[:review_request_id])
  end


end
