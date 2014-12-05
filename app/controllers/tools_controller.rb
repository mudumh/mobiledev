class ToolsController < ApplicationController
  def new
  @tool = Tool.new
  end

  def index
    @tool = Tool.all
  end

  def create
    @tool = Tool.new(tools_params)
    if @tool.save
      redirect_to tools_path
    else
      flash[:error] = 'something wrong'
      render 'new'
    end

  end

  def show
  end
  private
  
  def tool_params
      params.require(:tool).permit(:title,:url,:desc)
  end
end
