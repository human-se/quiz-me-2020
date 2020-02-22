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

end
