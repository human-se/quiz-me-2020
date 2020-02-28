class AddUserFkColToQuizzes < ActiveRecord::Migration[6.0]
  def change
    add_reference :quizzes, :user, foreign_key: true
  end
end
