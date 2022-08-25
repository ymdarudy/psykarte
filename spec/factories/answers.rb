FactoryBot.define do
  factory :answer do
    point { 0 }
    user { FactoryBot.create(:user, email: "#{SecureRandom.hex(10)}@example.com") }
    question { FactoryBot.create(:question) }
  end
end
