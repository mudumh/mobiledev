class Collection < ActiveRecord::Base
  has_many :collection_items
  belongs_to :user
end
