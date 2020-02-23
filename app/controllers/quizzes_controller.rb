class QuizzesController < ApplicationController

  def index
    # get all quiz objects
    quizzes = Quiz.all
    # display index view
    respond_to do |format|
      format.html { render :index, locals: { quizzes: quizzes } }
    end
  end

  def show
    # find a particular object
    quiz = Quiz.find(params[:id])
    # display the object
    respond_to do |format|
      format.html { render :show, locals: { quiz: quiz } }
    end
  end

end
