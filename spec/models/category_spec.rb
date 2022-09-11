require "rails_helper"

RSpec.describe Category, type: :model do
  describe "validation" do
    example "nameは必須" do
      category = build(:category, name: "")
      expect(category).to be_invalid

      category = build(:category, name: "カテゴリテスト")
      expect(category).to be_valid
    end
  end
end
