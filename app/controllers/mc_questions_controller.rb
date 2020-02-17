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

    def new
        question = McQuestion.new
        respond_to do |format|
            format.html { render :new, locals: { question: question } }
        end
    end

    def create
        # new object from params
        question = McQuestion.new(params.require(:mc_question).permit(:question, :answer, :distractor_1, :distractor_2))
        # respond_to block
        respond_to do |format|
            format.html do
                if question.save
                    # success message
                    flash[:success] = "Question saved successfully"
                    # redirect to index
                    redirect_to mc_questions_url
                else
                    # error message
                    flash.now[:error] = "Error: Question could not be saved"
                    # render new
                    render :new, locals: { question: question }
                end
            end
        end
    end

    def edit
        question = McQuestion.find(params[:id])
        respond_to do |format|
            format.html { render :edit, locals: { question: question } }
        end
    end

    def update
        # load existing object again from URL param
        question = McQuestion.find(params[:id])
        # respond_to block
        respond_to do |format|
            format.html do
                if question.update(params.require(:mc_question).permit(:question, :answer, :distractor_1, :distractor_2))
                    # success message
                    flash[:success] = 'Question updated successfully'
                    # redirect to index
                    redirect_to mc_questions_url
                else
                    # error message
                    flash.now[:error] = 'Error: Question could not be updated'
                    # render edit
                    render :edit, locals: { question: question }
                end
            end
        end
    end

end
