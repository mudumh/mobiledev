class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :username
  validates_uniqueness_of :username
  has_many :news_items
  has_many :review_requests
  has_many :tools
  has_many :tutorials
  has_many :forum_threads
  
end
