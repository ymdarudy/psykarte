FactoryBot.define do
  factory :answer do
    point { 0 }
    association :user
    association :question
  end
end
