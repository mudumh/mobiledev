module ReviewRequestsHelper
  def average_rating(review_req_id,parameter)
    @responses = ReviewResponse.where(review_request_id: review_req_id)
    @responses.sum(parameter)       
  end
end
