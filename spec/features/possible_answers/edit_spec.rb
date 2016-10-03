require 'rails_helper'

describe "Editting possible answers" do

  let!(:survey) { FactoryGirl.create(:full_survey, questions_count: 2) }

  def visit_survey_questions(survey)
    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end
  end

  def visit_question_possible_answers(question)
    within "#question_#{question.id}" do
      click_link "Possible answers"
    end
  end

  def visit_edit_possible_answer(possible_answer)
    within "#possible_answer_#{possible_answer.id}" do
      click_link "Edit"
    end
  end

  def update_possible_answer(options = {})
    options[:title] ||= "Title"
    options[:description] ||= "Description"
    options[:grade] ||= 10

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    fill_in "Grade", with: options[:grade]

    click_button "Update Possible answer"
  end

  it "updates successfully with correct data" do

    visit_survey_questions(survey)

    question = survey.questions.first

    visit_question_possible_answers(question)

    possible_answer = question.possible_answers.first

    visit_edit_possible_answer(possible_answer)

    expect(page).to have_content("Editing Possible answer")

    update_possible_answer(title: "Blue", description: "Blue is cool", grade: 13)

    expect(page).to have_content("success")
    expect(page).to have_content("Listing Possible answers")

    possible_answer = question.possible_answers.first

    expect(possible_answer.title).to eq("Blue")
    expect(possible_answer.description).to eq("Blue is cool")
    expect(possible_answer.grade).to eq(13)

  end

  it "dipslays error wit invalid data" do

    visit_survey_questions(survey)

    question = survey.questions.first

    visit_question_possible_answers(question)

    possible_answer = question.possible_answers.first

    visit_edit_possible_answer(possible_answer)

    expect(page).to have_content("Editing Possible answer")

    update_possible_answer(title: "", description: "", grade: "")

    expect(page).to have_content("error")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Grade can't be blank")

  end

  it "redirects to question possible answers index page by clicking back button" do

    visit_survey_questions(survey)

    question = survey.questions.first

    visit_question_possible_answers(question)

    possible_answer = question.possible_answers.first

    visit_edit_possible_answer(possible_answer)

    click_link "Back"

    expect(page).to have_content("Listing Possible answers")

  end

end
