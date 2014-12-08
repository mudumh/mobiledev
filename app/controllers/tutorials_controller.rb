class TutorialsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  def new
  @tutorial = current_user.tutorials.new
  end

  def index
    if params[:query]
      @tutorials = Tutorial.text_search(params[:query])
    else
      @tutorials = Tutorial.all
    end
  end

  def create
    @tutorial = current_user.tutorials.new(tutorial_params)
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
