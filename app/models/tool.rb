class Tool < ActiveRecord::Base
  acts_as_votable
  belongs_to :user

  include PgSearch
  pg_search_scope :search, :against => [:title,:desc],
  using: {tsearch: {dictionary: "english"}}

  def self.text_search(query)
    search(query)
   end
end
