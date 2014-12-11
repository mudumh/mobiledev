class ForumThread < ActiveRecord::Base
  has_many :comments, as: :commentable
  acts_as_votable
  belongs_to :user

end
