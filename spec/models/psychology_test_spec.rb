require "rails_helper"

RSpec.describe PsychologyTest, type: :model do
  describe "validation" do
    example "titleは必須、かつ255文字以下" do
      psychology_test = PsychologyTest.new(title: "", description: "説明", referrer: "参照元")
      expect(psychology_test).to be_invalid

      psychology_test = PsychologyTest.new(title: "a" * 256, description: "説明", referrer: "参照元")
      expect(psychology_test).to be_invalid

      psychology_test = PsychologyTest.new(title: "タイトル", description: "説明", referrer: "参照元")
      expect(psychology_test).to be_valid
    end

    example "descriptionは必須" do
      psychology_test = PsychologyTest.new(title: "タイトル", description: "", referrer: "参照元")
      expect(psychology_test).to be_invalid

      psychology_test = PsychologyTest.new(title: "タイトル", description: "説明", referrer: "参照元")
      expect(psychology_test).to be_valid
    end

    example "referrerは必須" do
      psychology_test = PsychologyTest.new(title: "タイトル", description: " 説明", referrer: "")
      expect(psychology_test).to be_invalid

      psychology_test = PsychologyTest.new(title: "タイトル", description: "説明", referrer: "参照元")
      expect(psychology_test).to be_valid
    end
  end
end
