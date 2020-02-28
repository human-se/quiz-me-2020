# == Schema Information
#
# Table name: quizzes
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_quizzes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Quiz < ApplicationRecord

  has_many(
    :mc_questions, # Quiz attribute containing an array of McQuestion objects
    class_name: 'McQuestion', # datatype of attribute
    foreign_key: 'quiz_id', # name of column containing FK in other table
    inverse_of: :quiz, # attribute on other side of association (parent Quiz object)
    dependent: :destroy # if a quiz is destroyed, also destroy all of its questions
  )

  belongs_to(
    :creator,
    class_name: 'User',
    foreign_key: 'user_id',
    inverse_of: :quizzes
  )

  validates :title, presence: true
  validates :description, presence: true

end
