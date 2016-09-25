FactoryGirl.define do
  factory :category do
    title "Factory Category"
  end

  factory :question do
    title "Factory Question"
    grade 10
    survey
    category
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
