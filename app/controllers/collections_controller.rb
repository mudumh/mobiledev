class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index,:show]
  respond_to :html

  def index
    
    @item_type = params[:item_type]
    @item_id = params[:item_id]
    @collections = Collection.all
    respond_with(@collections)
  end

  def show
    redirect_to collection_collection_items_path(@collection)
    
  end

  def new
    
    @item_id = params[:item_id]
    @item_type = params[:item_type]
    @collection = Collection.new
    respond_with(@collection)
  end

  def edit
  end

  def create
    
    @collection = Collection.new(name: collection_params[:name])
    @collection.user_id = current_user.id
    collection_item_params = {:item_type => collection_params[:item_type],:item_id => collection_params[:item_id] }
    @collection_item = CollectionItem.new(collection_item_params)
    @collection.save
    @collection_item.collection_id = @collection.id
    @collection_item.save
    
    redirect_to collection_collection_items_path(@collection)
  end

  def update
    @collection.update(collection_params)
    respond_with(@collection)
  end

  def destroy
    @collection.destroy
    respond_with(@collection)
  end

  private
    def set_collection
      @collection = Collection.find(params[:id])
    end

    def collection_params
      params.require(:collection).permit(:user_id, :name,:item_type,:item_id)
    end

end
