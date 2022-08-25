require "rails_helper"

RSpec.describe SupplementaryInformation, type: :model do
  describe "validation" do
    example "site_nameは必須" do
      supplementary_information = FactoryBot.build(:supplementary_information, site_name: "")
      expect(supplementary_information).to be_invalid

      supplementary_information = FactoryBot.build(:supplementary_information, site_name: "サイト名テスト")
      expect(supplementary_information).to be_valid
    end

    example "site_urlは必須" do
      supplementary_information = FactoryBot.build(:supplementary_information, site_url: "")
      expect(supplementary_information).to be_invalid

      supplementary_information = FactoryBot.build(:supplementary_information, site_url: "http://www.example.com")
      expect(supplementary_information).to be_valid
    end
  end
end
