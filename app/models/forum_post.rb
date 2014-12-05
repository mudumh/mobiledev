class ForumPost < ActiveRecord::Base
  belongs_to :forum_thread
  acts_as_votable
end
