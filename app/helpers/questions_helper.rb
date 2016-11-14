module QuestionsHelper
  def visit_survey_questions(survey)
    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end
  end
end
