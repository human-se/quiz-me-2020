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

require 'test_helper'

class McQuestionTest < ActiveSupport::TestCase

  test "fixtures are valid" do
    mc_questions.each do |q|
      assert q.valid?, q.errors.full_messages.inspect
    end  
  end

  test "question presence not valid" do
    q = mc_questions(:one)
    q.question = nil
    assert_not q.valid?
    q.question = ""
    assert_not q.valid?
  end

  test "answer presence not valid" do
    q = mc_questions(:one)
    q.answer = nil
    assert_not q.valid?
    q.answer = ""
    assert_not q.valid?
  end

  test "distractor_1 presence not valid" do
    q = mc_questions(:one)
    q.distractor_1 = nil
    assert_not q.valid?
    q.distractor_1 = ""
    assert_not q.valid?
  end

end
