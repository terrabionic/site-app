FactoryGirl.define do
  factory :type do
    name "MyString"
    subbranch nil
    code 1
  end
  factory :company_class do
    name "MyString"
    subbranch nil
    code 1
  end
  factory :subbranch do
    name "MyString"
    branch nil
    code 1
  end
  factory :tour_manager do
    welcom "MyText"
    map "MyText"
    filter_search "MyText"
    first_step "MyText"
    second_step "MyText"
    third_step_text "MyString"
    search_field "MyText"
  end
  factory :notification_manager do
    title "MyString"
    event nil
    notice nil
    date_pub "2017-03-31"
    sector nil
  end
  factory :notification do
    title "MyString"
    event nil
    notice nil
    date_pub "2017-03-16 11:25:57"
    user nil
    user_read false
  end
  factory :notice do
    title "MyString"
    link "MyString"
    sector nil
    description "MyText"
    active false
    date_pub "2017-03-14 18:22:57"
  end
  factory :pagefeed do
    title "MyString"
    link "MyString"
    sector nil
  end
  factory :event_monitor do
    title "MyString"
    start_at "2017-03-10 14:43:44"
    end_at "2017-03-10 14:43:44"
    allDay "MyString"
    address "MyString"
    website "MyString"
  end
  factory :state do
    name "MyString"
  end
  factory :branch do
    name "MyString"
    subsector nil
    code 1
  end
  factory :subsector do
    name "MyString"
    sector nil
  end
  factory :login_manager do
    email_contact "MyString"
    about_us "MyText"
    privacy "MyText"
    we_do "MyText"
  end
  factory :economic_activity do
    name "MyString"
  end
  factory :municipio do
    name "MyString"
    region nil
  end
  factory :region do
    name "MyString"
  end
  factory :event do
    title "MyString"
    start_at "2016-12-14 13:52:04"
    end_at "2016-12-14 13:52:04"
    allDay "MyString"
    name_exhibitor "MyString"
    level nil
    hours "MyString"
    price "MyString"
  end
  factory :level do
    title "MyString"
  end
  factory :survey_analysis do
    agente ""
    user_company ""
    reply ""
    organizational "MyText"
    innovation_management "MyText"
    innovation "MyText"
    guilds "MyText"
    copetential "MyText"
  end
  factory :role do
    name "MyString"
    description "MyText"
    admin false
    emprered false
    agentae false
  end
  factory :contact do
    name "MyString"
    email "MyString"
    subject "MyString"
    message "MyText"
  end
  factory :company do
    company_name "MyString"
    role "MyString"
    address "MyString"
    phone "MyString"
    email "MyString"
    name_agent "MyString"
    state "MyString"
    sector nil
    name "MyString"
    email_user "MyString"
    active false
    agent nil
    company_type "MyString"
    vat "MyString"
    street "MyString"
    street2 "MyString"
    city "MyString"
    cel "MyString"
    date_start "2016-10-06"
    line_business "MyString"
    num_workers 1
    annual_sales "MyString"
    company_history "MyText"
    company_products "MyString"
    company_market "MyString"
    company_problems "MyString"
    name_director "MyString"
    staff_interviewed "MyString"
    survey_period "MyString"
    name_created "MyString"
    completed false
  end
  factory :compnay do
    company_name "MyString"
    role "MyString"
    address "MyString"
    phone "MyString"
    email "MyString"
    name_agent "MyString"
    state "MyString"
    sector nil
    name "MyString"
    email_user "MyString"
    active false
    agent nil
    company_type "MyString"
    vat "MyString"
    street "MyString"
    street2 "MyString"
    city "MyString"
    cel "MyString"
    date_start "2016-10-06"
    line_business "MyString"
    num_workers 1
    annual_sales "MyString"
    company_history "MyText"
    company_products "MyString"
    company_market "MyString"
    company_problems "MyString"
    name_director "MyString"
    staff_interviewed "MyString"
    survey_period "MyString"
    name_created "MyString"
    completed false
  end
  factory :sector do
    name "MyString"
    description "MyText"
    image_sector ""
  end
  factory :user do
    
  end

  factory :possible_answer do
    question
    sequence(:title) { |n| "Possible answer #{n}" }
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
