require "rails_helper"

RSpec.describe Personality, type: :model do
  describe "validation" do
    let!(:psychology_test) { create(:psychology_test) }
    example "nameは必須、かつ30文字以下" do
      personality = build(:personality, name: "")
      expect(personality).to be_invalid

      personality = build(:personality, name: "a" * 31)
      expect(personality).to be_invalid

      personality = build(:personality, name: "特性名")
      expect(personality).to be_valid
    end

    example "descriptionは必須" do
      personality = build(:personality, description: "")
      expect(personality).to be_invalid

      personality = build(:personality, description: "説明")
      expect(personality).to be_valid
    end

    example "scoring_systemは必須、かつ整数のみ" do
      personality = build(:personality, scoring_system: "")
      expect(personality).to be_invalid

      personality = build(:personality, scoring_system: 1.5)
      expect(personality).to be_invalid

      personality = build(:personality, scoring_system: 1)
      expect(personality).to be_valid
    end
  end
end
