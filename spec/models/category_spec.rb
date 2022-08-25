require "rails_helper"

RSpec.describe Category, type: :model do
  describe "validation" do
    example "nameは必須" do
      category = FactoryBot.build(:category, name: "")
      expect(category).to be_invalid

      category = FactoryBot.build(:category, name: "カテゴリテスト")
      expect(category).to be_valid
    end
  end
end
