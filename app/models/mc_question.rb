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
#

class McQuestion < ApplicationRecord
  validates :question, presence: true
  validates :answer, presence: true
  validates :distractor_1, presence: true
end
