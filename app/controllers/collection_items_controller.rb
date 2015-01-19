class CollectionItemsController < ApplicationController
  before_action :set_collection_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @collection = Collection.find(params[:collection_id])
    @collection_items = @collection.collection_items
    @news_items = []
    @tools = []
    @tutorials = []
    @collection_items.each do |collection_item|
      if collection_item.item_type == "tool"
          @tools.push(Tool.find(collection_item.item_id))


      elsif collection_item.item_type == "news"
          @news_items.push(NewsItem.find(collection_item.item_id))
      else
          @tutorials.push(Tutorial.find(collection_item.item_id))
      end

    end
    respond_with(@collection_items)
  end

  def show
    respond_with(@collection_item)
  end

  def new
    @collection_item = CollectionItem.new
    respond_with(@collection_item)
  end

  def edit
  end

  def create
    
    @collection_item = CollectionItem.new(collection_item_params)
    if @collection_item.save
        redirect_to collection_collection_items_path(collection_item_params[:collection_id])
    else
    end
    
  end

  def update
    @collection_item.update(collection_item_params)
    respond_with(@collection_item)
  end

  def destroy
    @collection_item.destroy
    respond_with(@collection_item)
  end

  private
    def set_collection_item
      @collection_item = CollectionItem.find(params[:id])
    end

    def collection_item_params
      params.permit(:item_id, :item_type, :collection_id)
    end
end
