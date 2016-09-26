FactoryGirl.define do
  factory :answer do
    reply nil
    question nil
    value "MyString"
  end
  factory :reply do
    survey nil
  end

  factory :note do
    sequence(:title) { |n| "Note #{n}" }
    description "MyText"
    sequence(:points) { |n| n }
    question
  end

  factory :category do
    sequence(:title) { |n| "Category #{n}" }
  end

  factory :question do
    title "Factory Question"
    grade 10
    survey
    category

    factory :question_with_notes do
      transient do
        notes_count 3
      end

      after(:create) do |question, evaluator|
        create_list(:note, evaluator.notes_count, question: question)
      end

    end
  end

  factory :survey do
    title "Factory Survey"

    factory :survey_with_questions do
      transient do
        questions_count 5
      end

      after(:create) do |survey, evaluator|
        create_list(:question, evaluator.questions_count, survey: survey, category_id: 1)
      end
    end

  end
end
