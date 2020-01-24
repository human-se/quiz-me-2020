class StaticPagesController < ApplicationController

  def welcome
    respond_to do |format|
      format.html { render :welcome }
    end
  end

end
