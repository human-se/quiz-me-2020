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

  def new
    # make empty quiz object
    quiz = Quiz.new
    # display new view
    respond_to do |format|
      format.html { render :new, locals: { quiz: quiz } }
    end
  end
  
  def create
    # new object from params
    quiz = Quiz.new(params.require(:quiz).permit(:title, :description))
    # respond_to block
    respond_to do |format|
      format.html do
        if quiz.save
          # success message
          flash[:success] = "Quiz saved successfully"
          # redirect to index
          redirect_to quizzes_url
        else
          # error message
          flash.now[:error] = "Error: Quiz could not be saved"
          # render new
          render :new, locals: { quiz: quiz }
        end
      end
    end
  end

  def edit
    # object to use in form
    quiz = Quiz.find(params[:id])
    respond_to do |format|
      format.html { render :edit, locals: { quiz: quiz } }
    end
  end
  
  def update
    # load existing object again from URL param
    quiz = Quiz.find(params[:id])
    # respond_to block
    respond_to do |format|
      format.html do
        if quiz.update(params.require(:quiz).permit(:title, :description))
          # success message
          flash[:success] = 'Quiz updated successfully'
          # redirect to index
          redirect_to quizzes_url
        else
          # error message
          flash.now[:error] = 'Error: Quiz could not be updated'
          # render edit
          render :edit, locals: { quiz: quiz }
        end
      end
    end
  end

  def destroy
    # load existing object again from URL param
    quiz = Quiz.find(params[:id])
    # destroy object
    quiz.destroy
    # respond_to block
    respond_to do |format|
      format.html do
        # success message
        flash[:success] = 'Quiz removed successfully'
        # redirect to index
        redirect_to quizzes_url
      end
    end
  end

end
