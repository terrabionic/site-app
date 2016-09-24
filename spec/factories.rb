FactoryGirl.define do
  factory :question do
    survey ""
    title "MyString"
    value 1
  end
  factory :survey do
    title "Factory Survey"
  end
end
