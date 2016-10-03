module RepliesHelper
  def visit_survey_replies(survey)
    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Replies"
    end
  end
end
