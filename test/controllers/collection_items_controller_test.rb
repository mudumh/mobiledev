require 'test_helper'

class CollectionItemsControllerTest < ActionController::TestCase
  setup do
    @collection_item = collection_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collection_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collection_item" do
    assert_difference('CollectionItem.count') do
      post :create, collection_item: { collection_id: @collection_item.collection_id, item_id: @collection_item.item_id, type: @collection_item.type }
    end

    assert_redirected_to collection_item_path(assigns(:collection_item))
  end

  test "should show collection_item" do
    get :show, id: @collection_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @collection_item
    assert_response :success
  end

  test "should update collection_item" do
    patch :update, id: @collection_item, collection_item: { collection_id: @collection_item.collection_id, item_id: @collection_item.item_id, type: @collection_item.type }
    assert_redirected_to collection_item_path(assigns(:collection_item))
  end

  test "should destroy collection_item" do
    assert_difference('CollectionItem.count', -1) do
      delete :destroy, id: @collection_item
    end

    assert_redirected_to collection_items_path
  end
end
