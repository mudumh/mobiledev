class AddReviewRequestIdToReviewResponse < ActiveRecord::Migration
  def change
    add_column :review_responses, :review_request_id, :integer
  end
end
