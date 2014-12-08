class ReviewRequest < ActiveRecord::Base
  has_many :review_responses
  belongs_to :user
end
