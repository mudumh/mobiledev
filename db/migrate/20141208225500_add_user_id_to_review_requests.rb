class AddUserIdToReviewRequests < ActiveRecord::Migration
  def change
    add_column :review_requests, :user_id, :integer
  end
end
