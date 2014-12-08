class Tutorial < ActiveRecord::Base
  acts_as_votable
  include PgSearch
  pg_search_scope :search, :against => [:title],
  using: {tsearch: {dictionary: "english"}}

   def self.text_search(query)
      search(query)
  end
end
