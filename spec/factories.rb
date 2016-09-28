FactoryGirl.define do
  factory :answer do
    reply
    question
    content "MyString"
  end

  factory :reply do
    survey
  end

  factory :note do
    sequence(:title) { |n| "Note #{n}" }
    description "MyText"
    points 7
    question
  end

  factory :category do
    sequence(:title) { |n| "Category #{n}" }
  end

  factory :question do
    sequence(:title) { |n| "Factory Question #{n}" }
    grade 10
    survey
    category

    factory :full_question do
      transient do
        notes_count 3
        answers_count 3
      end

      after(:create) do |question, evaluator|
        create_list(:note, evaluator.notes_count, question: question)
        create_list(:answer, evaluator.answers_count, question: question)
      end

    end
  end

  factory :survey do
    title "Factory Survey"

    factory :full_survey do
      transient do
        questions_count 5
        replies_count 5
      end

      after(:create) do |survey, evaluator|
        create_list(:full_question, evaluator.questions_count, survey: survey)
        create_list(:reply, evaluator.replies_count, survey: survey)
      end

    end
  end

end
