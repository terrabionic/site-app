FactoryGirl.define do

  factory :question do
    title "Factory Question"
    value 10
    survey
  end

  factory :survey do
    title "Factory Survey"

    factory :survey_with_questions do
      transient do
        questions_count 5
      end

      after(:create) do |survey, evaluator|
        create_list(:question, evaluator.questions_count, survey: survey)
      end
    end

  end
end
