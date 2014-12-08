class ToolsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  def new
    @tool = current_userTool.new
  end

  def index
    @tools = Tool.all
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tools_path
    else
      flash[:error] = 'something wrong'
      render 'new'
    end

  end

  def show
  end

   def upvote
    @tool = Tool.find(params[:id])
    @tool.upvote_by current_user
    @tool.save
    redirect_to tools_path
  end

  private
  
  def tool_params
      params.require(:tool).permit(:title,:url,:desc)
  end
end
