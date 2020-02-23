class QuizzesController < ApplicationController

  def index
    # get all quiz objects
    quizzes = Quiz.all
    # display index view
    respond_to do |format|
      format.html { render :index, locals: { quizzes: quizzes } }
    end
  end

end
