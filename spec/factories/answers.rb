FactoryBot.define do
  factory :answer do
    point { 0 }
    user { FactoryBot.create(:user) }
    question { FactoryBot.create(:question) }
  end
end
