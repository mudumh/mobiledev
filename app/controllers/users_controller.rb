class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @tools_upvoted = @user.get_up_voted Tool
    @news_upvoted = @user.get_up_voted NewsItem
    
    @tutorials_upvoted = @user.get_up_voted Tutorial
    
  end

  def index
    
  end
end
