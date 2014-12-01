class ForumThread < ActiveRecord::Base
  has_many :forum_posts
  accepts_nested_attributes_for :forum_posts

end
