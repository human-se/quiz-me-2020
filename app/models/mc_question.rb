# == Schema Information
#
# Table name: mc_questions
#
#  id           :bigint           not null, primary key
#  answer       :string
#  distractor_1 :string
#  distractor_2 :string
#  question     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  quiz_id      :bigint
#
# Indexes
#
#  index_mc_questions_on_quiz_id  (quiz_id)
#
# Foreign Keys
#
#  fk_rails_...  (quiz_id => quizzes.id)
#

class McQuestion < ApplicationRecord

  belongs_to(
    :quiz, # McQuestion attribute of with datatype Quiz
    class_name: 'Quiz', # datatype of attribute
    foreign_key: 'quiz_id', # name of column containing FK
    inverse_of: :mc_questions # attribute on other side of association (array containing all McQuestion objects belonging to a quiz)
  )

  validates :question,
    presence: true,
    uniqueness: true
  validates :answer, presence: true
  validates :distractor_1, presence: true
  validate :choices_cannot_be_duplicate

  def choices_cannot_be_duplicate
    if answer == distractor_1
      errors.add(:distractor_1, "can't be the same as any other choice")
    end
    if answer == distractor_2
      errors.add(:distractor_2, "can't be the same as any other choice")
    end
    if distractor_1 == distractor_2
      errors.add(:distractor_2, "can't be the same as any other choice")
    end
  end

end
