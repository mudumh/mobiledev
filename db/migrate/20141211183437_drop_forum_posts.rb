class DropForumPosts < ActiveRecord::Migration  
    def up
      drop_table :forum_posts
    end
end
