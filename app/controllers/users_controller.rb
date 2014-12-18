class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    
    if params[:s] == 'comments'
      @comments = @user.comments
    elsif params[:s] == 'upvotes'
      @tools_upvoted = @user.get_up_voted Tool
      @news_upvoted = @user.get_up_voted NewsItem
      @tutorials_upvoted = @user.get_up_voted Tutorial
    end
  end

  def index
    
  end
end
