require 'rails_helper'

describe "Creating possible answers" do

  let!(:survey) { FactoryGirl.create(:full_survey, questions_count: 2) }

  def visit_survey_questions(survey)
    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end
  end

  def visit_new_question_possible_answer(question)
    within "#question_#{question.id}" do
      click_link "Possible answers"
    end

    click_link "New Possible answer"
  end

  def create_possible_answer(options = {})
    options[:title] ||= "Title"
    options[:description] ||= "Description"
    options[:grade] ||= 10

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    fill_in "Grade", with: options[:grade]

    click_button "Create Possible answer"
  end

  it "is successful with valid data" do

    visit_survey_questions(survey)

    question = survey.questions.first

    visit_new_question_possible_answer(question)

    expect(page).to have_content("New Possible Answer")

    create_possible_answer(title: "Blue", description: "Blue is cool", grade: 13)

    expect(page).to have_content("success")

    expect(page).to have_content("Listing Possible answers - #{question.title}")

    expect(question.possible_answers.count).to eq(4)

    expect(question.possible_answers.last.title).to eq("Blue")
    expect(question.possible_answers.last.description).to eq("Blue is cool")
    expect(question.possible_answers.last.grade).to eq(13)

  end

  it "displays error with invalid data" do

    visit_survey_questions(survey)

    question = survey.questions.first

    visit_new_question_possible_answer(question)

    create_possible_answer(title: "", description: "", grade: "diez")

    expect(page).to have_content("error")

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Grade is not a number")

  end

end
