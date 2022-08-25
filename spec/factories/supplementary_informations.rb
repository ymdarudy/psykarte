FactoryBot.define do
  factory :supplementary_information do
    site_name { "サイト名" }
    site_url { "http://www.test.com" }
    psychology_test { FactoryBot.create(:psychology_test) }
  end
end
