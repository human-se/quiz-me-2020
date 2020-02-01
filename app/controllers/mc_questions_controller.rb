class McQuestionsController < ApplicationController

    def index
        questions = McQuestion.all
        respond_to do |format|
            format.html { render :index, locals: { questions: questions } }
        end
    end

    def show
        question = McQuestion.find(params[:id])
        respond_to do |format|
            format.html { render :show, locals: { question: question } }
        end
    end

end
