# == Schema Information
#
# Table name: quizzes
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Quiz < ApplicationRecord

  has_many(
    :mc_questions, # Quiz attribute containing an array of McQuestion objects
    class_name: 'McQuestion', # datatype of attribute
    foreign_key: 'quiz_id', # name of column containing FK in other table
    inverse_of: :quiz, # attribute on other side of association (parent Quiz object)
    dependent: :destroy # if a quiz is destroyed, also destroy all of its questions
  )

  validates :title, presence: true
  validates :description, presence: true

end
