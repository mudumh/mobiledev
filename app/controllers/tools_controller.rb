class ToolsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index,:show]
  def new
    @tool = current_user.tools.new
  end

  def index
    
    if params[:query]
      @tools = Tool.text_search(params[:query])
    else
      @tools = Tool.all
    end
    
  end

  def create
    @tool = current_user.tools.new(tool_params)
    if @tool.save
      redirect_to tools_path
    else
      flash[:error] = 'something wrong'
      render 'new'
    end

  end

  def show
    @tool = Tool.find(params[:id])
    @commentable = @tool
    @comments = @commentable.comments
    @comment = Comment.new
  end

   def upvote
    @tool = Tool.find(params[:id])
    @tool.vote_by :voter => current_user
    @tool.save
    redirect_to tools_path
  end


  private
  
  def tool_params
      params.require(:tool).permit(:title,:url,:description)
  end
end
