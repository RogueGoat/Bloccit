class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(params.require(:question).permit(:title, :body, :resolved))
    if @question.save
      flash[:notice] = "Question has been saved!"
      redirect_to @question
    else
      flash[:error] = "That is not a valid question, or there was an error saving it, please try again."
      render :new
    end
  end


  def edit
    @question = Question.find(params[:id])
  end
  
  def update 
    @question = Question.find(params[:id])
  if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
    flash[:notice] = "Your Question has been Updated!"
    redirect_to @question
  else
    flash[:error] = "There has been an error with your Question, try again"
    render :edit
  end
  
  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "Your Question has been OBLITERATED!"
      redirect_to questions_path
    else
      flash[:error] = "We couldn't delete your question, try again!"
      render :show
    end
  end
  
  end
end
