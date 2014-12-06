class CreateReviewResponses < ActiveRecord::Migration
  def change
    create_table :review_responses do |t|
      t.integer :aesthetics
      t.integer :easeofuse
      t.integer :responsiveness
      t.integer :functionality
      t.integer :innovativeness

      t.timestamps
    end
  end
end
