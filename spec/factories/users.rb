FactoryBot.define do
  factory :user do
    name { "山田" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" }
  end
end
