class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @tools_upvoted = @user.get_up_voted Tool
    @news_upvoted = @user.get_up_voted NewsItem
    @tutorials_upvoted = @user.get_up_voted Tutorial
    if params[:s] == 'comments'
      @comments = @user.comments
    end
  end

  def index
    
  end
end
