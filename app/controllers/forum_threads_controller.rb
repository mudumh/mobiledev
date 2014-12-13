
class ForumThreadsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  
  def index
    if params[:query]
      @forum_threads = ForumThread.text_search(params[:query])
    else
      @forum_threads = ForumThread.all
    end
    
  end

  def new
    @forum_thread = current_user.forum_threads.new()
  end
  
  def show
    @forum_thread = ForumThread.find(params[:id])
    @commentable = @forum_thread
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def create
    
    @forum_thread = current_user.forum_threads.new(forum_thread_params)
    #@forum_thread.forum_posts.first.user_id = current_user.id
    if @forum_thread.save
      redirect_to @forum_thread
    else
      render action: :new
    end
   
  end

  def upvote
    @forum_thread = ForumThread.find(params[:id])
    @forum_thread.vote_by :voter => current_user
    @forum_thread.save
    redirect_to forum_threads_path
  end

  private

    def set_forum_thread
      @forum_thread = ForumThread.find(params[:id])
    end

    def forum_thread_params
      params.require(:forum_thread).permit(:subject)
    end
end
