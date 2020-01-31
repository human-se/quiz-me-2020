class McQuestionsController < ApplicationController

    def index
        questions = McQuestion.all
        respond_to do |format|
            format.html { render :index, locals: { questions: questions } }
        end
    end

end
