class ForumThread < ActiveRecord::Base
  has_many :forum_posts
  accepts_nested_attributes_for :forum_posts
  acts_as_votable
  belongs_to :user

end
