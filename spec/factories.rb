FactoryGirl.define do

  factory :possible_answer do
    question
    title "MyString"
    description "MyString"
    grade 5
  end

  factory :answer do
    reply
    question
    possible_answer
  end

  factory :reply do
    survey
  end

  factory :category do
    sequence(:title) { |n| "Category #{n}" }
  end

  factory :question do
    sequence(:title) { |n| "Factory Question #{n}" }
    survey
    category

    factory :full_question do
      transient do
        answers_count 3
        possible_answers_count 3
      end

      after(:create) do |question, evaluator|
        create_list(:answer, evaluator.answers_count, question: question, possible_answer_id: 1)
        create_list(:possible_answer, evaluator.possible_answers_count, question: question)
      end

    end
  end

  factory :survey do
    title "Factory Survey"

    factory :full_survey do
      transient do
        replies_count 5
        questions_count 5
      end

      after(:create) do |survey, evaluator|
        create_list(:full_question, evaluator.questions_count, survey: survey)
        create_list(:reply, evaluator.replies_count, survey: survey)
      end

    end
  end

end
