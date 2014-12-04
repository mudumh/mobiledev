class NewsItemsController < ApplicationController
  
  def new
    @news_item = NewsItem.new
  end
  
  def index
    @news_items = NewsItem.all
  end
  
  def show
  end
  
  def create
    @news_item = NewsItem.new(news_params)
    if @news_item.save
        redirect_to news_items_path
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end



  end
  
  private
  def news_params
    params.require(:news_item).permit(:url,:title)
  end

end
