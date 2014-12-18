class CommentsController < ApplicationController
  before_filter :load_commentable
  def index
    
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new(:parent_id => params[:parent_id])
  end

  def create
    
    @comment = @commentable.comments.new(comment_params)
    @comment.parent_id = comment_params[:parent_id]
    @comment.user_id = current_user.id  

    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:parent_id)
  end
    

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
