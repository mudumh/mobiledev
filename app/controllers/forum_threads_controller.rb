class ForumThreadsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  
  def index
    @forum_threads = ForumThread.all
  end

  def new
    @forum_thread = current_user.forum_threads.new()
    @forum_thread.forum_posts.new
  
  end
  
  def show
     set_forum_thread
     @forum_post = ForumPost.new

  end

  def create
    
    @forum_thread = current_user.forum_threads.new(forum_thread_params)
    
    if @forum_thread.save
      redirect_to @forum_thread
    else
      render action: :new
    end
   
  end

  def upvote
    @forum_thread = ForumThread.find(params[:id])
    @forum_thread.upvote_by current_user
    @forum_thread.save
    redirect_to forum_threads_path
  end

  private

    def set_forum_thread
      @forum_thread = ForumThread.find(params[:id])
    end

    def forum_thread_params
      params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])
    end

end
