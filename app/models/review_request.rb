class ReviewRequest < ActiveRecord::Base
  has_many :review_responses
end
