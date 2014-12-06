class CreateReviewRequests < ActiveRecord::Migration
  def change
    create_table :review_requests do |t|
      t.text :feedback_request
      t.string :title
      t.string :url
      t.string :platform

      t.timestamps
    end
  end
end
