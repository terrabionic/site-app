module PossibleAnswersHelper
  def visit_question_possible_answers(question)
    within "#question_#{question.id}" do
      click_link "Possible answers"
    end
  end
end
