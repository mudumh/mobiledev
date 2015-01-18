class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show]
  respond_to :html

  def index
    @submissions = Submission.all
    respond_with(@submissions)
  end

  def show
    respond_with(@submission)
  end

  def new
    @submission = Submission.new
    respond_with(@submission)
  end

  def edit
  end

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      if @submission.category == "news"
          news_params = submission_params.except(:category)
          @news_item = current_user.news_items.create(news_params)
          redirect_to news_items_path
      
      elsif @submission.category == "tool"
          tool_params = submission_params.except(:category)
          @tool = current_user.tools.create(tool_params)
          redirect_to tools_path
      else 
          tutorials_params = submission_params.except(:category)
          @tutorials = current_user.tutorials.create(tutorials_params)
          redirect_to tutorials_path
      end
   else
    render :new
  end
  end

  def update
    @submission.update(submission_params)
    respond_with(@submission)
  end

  def destroy
    @submission.destroy
    respond_with(@submission)
  end

  private
    def set_submission
      @submission = Submission.find(params[:id])
    end

    def submission_params
      params.require(:submission).permit(:title, :url, :description, :category)
    end
end
