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

require 'test_helper'

class QuizTest < ActiveSupport::TestCase

  test "fixtures are valid" do
    quizzes.each do |q|
      assert q.valid?, q.errors.full_messages.inspect
    end
  end

  test "title presence not valid" do
    q = quizzes(:one)
    q.title = nil
    assert_not q.valid?
    q.title = ""
    assert_not q.valid?
  end
  
  test "description presence not valid" do
    q = quizzes(:one)
    q.description = nil
    assert_not q.valid?
    q.description = ""
    assert_not q.valid?
  end

end
