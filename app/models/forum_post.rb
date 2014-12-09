class ForumPost < ActiveRecord::Base
  belongs_to :forum_thread
  belongs_to :user
  acts_as_votable
end
