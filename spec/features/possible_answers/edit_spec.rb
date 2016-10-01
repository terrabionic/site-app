require 'rails_helper'

describe "Editting possible answers" do
  it "updates successfully with correct data" do
    survey = FactoryGirl.create(:full_survey, questions_count: 2)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end

    question = survey.questions.first

    within "#question_#{question.id}" do
      click_link "Possible answers"
    end

    possible_answer = question.possible_answers.first

    within "#possible_answer_#{possible_answer.id}" do
      click_link "Edit"
    end

    expect(page).to have_content("Editing Possible answer")

    fill_in "Title", with: "Blue"
    fill_in "Description", with: "Blue is cool"
    fill_in "Grade", with: 13

    click_button "Update Possible answer"

    expect(page).to have_content("success")
    expect(page).to have_content("Listing Possible answers")

    possible_answer = question.possible_answers.first

    expect(possible_answer.title).to eq("Blue")
    expect(possible_answer.description).to eq("Blue is cool")
    expect(possible_answer.grade).to eq(13)

  end

  it "dipslays error wit invalid data" do
    survey = FactoryGirl.create(:full_survey, questions_count: 2)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end

    question = survey.questions.first

    within "#question_#{question.id}" do
      click_link "Possible answers"
    end

    possible_answer = question.possible_answers.first

    within "#possible_answer_#{possible_answer.id}" do
      click_link "Edit"
    end

    expect(page).to have_content("Editing Possible answer")

    fill_in "Title", with: ""
    fill_in "Description", with: ""
    fill_in "Grade", with: ""

    click_button "Update Possible answer"

    expect(page).to have_content("error")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Grade can't be blank")

  end

  it "redirects to question possible answers index page by clicking back button" do
    survey = FactoryGirl.create(:full_survey, questions_count: 2)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end

    question = survey.questions.first

    within "#question_#{question.id}" do
      click_link "Possible answers"
    end

    possible_answer = question.possible_answers.first

    within "#possible_answer_#{possible_answer.id}" do
      click_link "Edit"
    end

    click_link "Back"

    expect(page).to have_content("Listing Possible answers")

  end

end
