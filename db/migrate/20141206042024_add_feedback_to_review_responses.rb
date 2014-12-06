class AddFeedbackToReviewResponses < ActiveRecord::Migration
  def change
    add_column :review_responses, :feedback, :text
  end
end
