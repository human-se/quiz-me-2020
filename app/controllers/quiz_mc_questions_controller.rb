class QuizMcQuestionsController < ApplicationController

  def index
    quiz = Quiz.includes(:mc_questions).find(params[:id])
    respond_to do |format|
      format.html { render :index, locals: { quiz: quiz, questions: quiz.mc_questions } }
    end
  end

end
