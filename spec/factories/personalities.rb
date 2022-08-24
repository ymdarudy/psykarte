FactoryBot.define do
  factory :personality do
    name { "特性名" }
    description { "説明" }
    scoring_system { 1 }
    psychology_test { FactoryBot.create(:psychology_test) }
  end
end
