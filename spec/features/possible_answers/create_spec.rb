require 'rails_helper'

describe "Creating possible answers" do
  it "is successful with valid data" do
    survey = FactoryGirl.create(:full_survey, questions_count: 2)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end

    question = survey.questions.first

    within "#question_#{question.id}" do
      click_link "Possible answers"
    end

    click_link "New Possible answer"

    expect(page).to have_content("New Possible Answer")

    fill_in "Title", with: "Blue"
    fill_in "Description", with: "Blue is cool"
    fill_in "Grade", with: 13

    click_button "Create Possible answer"

    expect(page).to have_content("success")

    expect(page).to have_content("Listing Possible answers - #{question.title}")

    expect(question.possible_answers.count).to eq(4)

    expect(question.possible_answers.last.title).to eq("Blue")
    expect(question.possible_answers.last.description).to eq("Blue is cool")
    expect(question.possible_answers.last.grade).to eq(13)

  end

  it "displays error with invalid data" do

    survey = FactoryGirl.create(:full_survey, questions_count: 2)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end

    question = survey.questions.first

    within "#question_#{question.id}" do
      click_link "Possible answers"
    end

    click_link "New Possible answer"

    fill_in "Title", with: ""
    fill_in "Description", with: ""
    fill_in "Grade", with: "diez"

    click_button "Create Possible answer"

    expect(page).to have_content("error")

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Grade is not a number")

  end

end
