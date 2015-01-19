class CreateCollectionItems < ActiveRecord::Migration
  def change
    create_table :collection_items do |t|
      t.string :item_type
      t.integer :item_id
      t.integer :collection_id

      t.timestamps
    end
  end
end
