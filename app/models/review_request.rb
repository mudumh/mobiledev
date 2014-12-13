class ReviewRequest < ActiveRecord::Base
  has_many :review_responses
  belongs_to :user

  include PgSearch
  pg_search_scope :search, :against => [:feedback_request,:title,:platform],
  using: {tsearch: {dictionary: "english"}}

  def self.text_search(query)
    search(query)
  end

end
