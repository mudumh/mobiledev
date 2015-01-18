class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string :title
      t.string :url
      t.integer :upvotes
      t.string :description

      t.timestamps
    end
  end
end
