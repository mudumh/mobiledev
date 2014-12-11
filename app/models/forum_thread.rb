class ForumThread < ActiveRecord::Base
  has_many :comments, as: :commentable
  acts_as_votable
  belongs_to :user
  include PgSearch
  
  pg_search_scope :search, :against => [:subject],
  using: {tsearch: {dictionary: "english"}}

   def self.text_search(query)
      search(query)
  end

end
