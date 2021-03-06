class NewsItemsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  def new
    @news_item = current_user.news_items.new
  end
  
  def index
    
    if params[:query]
      @news_items = NewsItem.text_search(params[:query])
    else
      @news_items = NewsItem.all
    end 
  end
  
 def show
    @news_item = NewsItem.find(params[:id])
    @commentable = @news_item
    @comments = @commentable.comments
    @comment = Comment.new
  end
  
  def create
    @news_item = current_user.news_items.new(news_params)
    @news_item.upvotes = 0
    if @news_item.save
        redirect_to news_items_path
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end
    
  def upvote
    @news_item = NewsItem.find(params[:id])
    @news_item.vote_by :voter => current_user
    @news_item.save
    redirect_to news_items_path
  end

  private
  def news_params
    params.require(:news_item).permit(:url,:title)
  end

end
