require "rails_helper"

RSpec.describe PsychologyTest, type: :model do
  describe "validation" do
    example "titleは必須、かつ255文字以下" do
      psychology_test = build(:psychology_test, title: "")
      expect(psychology_test).to be_invalid

      psychology_test = build(:psychology_test, title: "a" * 256)
      expect(psychology_test).to be_invalid

      psychology_test = build(:psychology_test, title: "タイトル")
      expect(psychology_test).to be_valid
    end

    example "descriptionは必須" do
      psychology_test = build(:psychology_test, description: "")
      expect(psychology_test).to be_invalid

      psychology_test = build(:psychology_test, description: "説明")
      expect(psychology_test).to be_valid
    end

    example "referrerは必須" do
      psychology_test = build(:psychology_test, referrer: "")
      expect(psychology_test).to be_invalid

      psychology_test = build(:psychology_test, referrer: "参照元")
      expect(psychology_test).to be_valid
    end
  end

  describe "モデルのメソッド" do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user, name: "user2", email: "test2@example.com") }
    let!(:psychology_test) { create(:psychology_test) }
    let!(:psychology_test2) { create(:psychology_test, title: "心理テスト2") }
    let!(:personality) { create(:personality, psychology_test: psychology_test) }
    let!(:personality2) { create(:personality, psychology_test: psychology_test2) }
    let!(:question) { create(:question, personality: personality) }
    let!(:question2) { create(:question, personality: personality2) }
    let!(:answer) { create(:answer, question: question, user: user) }
    let!(:answer2) { create(:answer, question: question2, user: user2) }

    example "scoped_by_user_answeredメソッドで特定のユーザーが回答済みの心理テストを抽出できる" do
      scoped_tests = PsychologyTest.scoped_by_user_answered(user)
      expect(scoped_tests.count).to eq(1)
      expect(scoped_tests.first).to eq(psychology_test)
      expect(scoped_tests.first).not_to eq(psychology_test2)
    end

    example "scoped_by_user_unansweredメソッドで特定のユーザーが未回答の心理テストを抽出できる" do
      scoped_tests = PsychologyTest.scoped_by_user_unanswered(user)
      expect(scoped_tests.count).to eq(1)
      expect(scoped_tests.first).to eq(psychology_test2)
      expect(scoped_tests.first).not_to eq(psychology_test)
    end
  end
end
