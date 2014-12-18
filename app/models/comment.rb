class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_ancestry
  belongs_to :user
end
