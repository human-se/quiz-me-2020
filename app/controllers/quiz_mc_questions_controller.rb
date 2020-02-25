class QuizMcQuestionsController < ApplicationController

  def index
    quiz = Quiz.includes(:mc_questions).find(params[:id])
    respond_to do |format|
      format.html { render :index, locals: { quiz: quiz, questions: quiz.mc_questions } }
    end
  end

  def new
    quiz = Quiz.find(params[:id])
    respond_to do |format|
      format.html { render :new, locals: { quiz: quiz, question: quiz.mc_questions.build } }
    end
  end

  def create
    # find the quiz to which the new question will be added
    quiz = Quiz.find(params[:id])
    # allocate a new question associated with the quiz
    question = quiz.mc_questions.build(params.require(:mc_question).permit(:question, :answer, :distractor_1, :distractor_2))
    # respond_to block
    respond_to do |format|
      format.html do
        if question.save
          # success message
          flash[:success] = "Question saved successfully"
          # redirect to index
          redirect_to quiz_mc_questions_url(quiz)
        else
          # error message
          flash.now[:error] = "Error: Question could not be saved"
          # render new
          render :new, locals: { quiz: quiz, question: question }
        end
      end
    end
  end

end
