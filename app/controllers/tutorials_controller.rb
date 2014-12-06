class TutorialsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  def new
  @tutorial = Tutorial.new
  end

  def index
    @tutorials = Tutorial.all
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)
    if @tutorial.save
      redirect_to tutorials_path
    else
      flash[:error] = 'something wrong'
      render 'new'
    end
  end

  def show
  end

  def upvote
    @tutorials = Tutorial.find(params[:id])
    @tutorials.upvote_by current_user
    @tutorials.save
    redirect_to tutorials_path
  end
  private
  
  def tutorial_params
      params.require(:tutorial).permit(:title,:url)
  end
end
