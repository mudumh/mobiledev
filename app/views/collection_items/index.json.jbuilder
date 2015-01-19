json.array!(@collection_items) do |collection_item|
  json.extract! collection_item, :id, :type, :item_id, :collection_id
  json.url collection_item_url(collection_item, format: :json)
end
