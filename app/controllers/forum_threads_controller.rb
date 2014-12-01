class ForumThreadsController < ApplicationController
  def index
    @forum_threads = ForumThread.all
  end
  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.new
  
  end
  
  def show
     set_forum_thread
     @forum_post = ForumPost.new

  end

  def create
    
    @forum_thread = ForumThread.new(forum_thread_params)
    
    if @forum_thread.save
      redirect_to @forum_thread
    else
      render action: :new
    end
   
  end

  private

    def set_forum_thread
      @forum_thread = ForumThread.find(params[:id])
    end

    def forum_thread_params
      params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])
    end

end
