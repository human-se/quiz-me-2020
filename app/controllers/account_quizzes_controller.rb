class AccountQuizzesController < ApplicationController

  before_action :authenticate_user!
  
  def index
    # get all quiz objects belonging to current user
    quizzes = current_user.quizzes
    # display index view
    respond_to do |format|
      format.html { render :index, locals: { quizzes: quizzes } }
    end
  end

end
