require "rails_helper"

RSpec.describe Question, type: :model do
  describe "validation" do
    example "titleは必須" do
      question = FactoryBot.build(:question, title: "")
      expect(question).to be_invalid

      question = FactoryBot.build(:question, title: "設問1")
      expect(question).to be_valid
    end

    example "choice_min_pointは必須、かつ整数のみ" do
      question = FactoryBot.build(:question, choice_min_point: "")
      expect(question).to be_invalid

      question = FactoryBot.build(:question, choice_min_point: 1.5)
      expect(question).to be_invalid

      question = FactoryBot.build(:question, choice_min_point: 2)
      expect(question).to be_valid
    end

    example "choice_max_pointは必須、かつ整数のみ" do
      question = FactoryBot.build(:question, choice_max_point: "")
      expect(question).to be_invalid

      question = FactoryBot.build(:question, choice_max_point: 3.5)
      expect(question).to be_invalid

      question = FactoryBot.build(:question, choice_max_point: 4)
      expect(question).to be_valid
    end

    example "choice_min_wordは必須、かつ30文字以内" do
      question = FactoryBot.build(:question, choice_min_word: "")
      expect(question).to be_invalid

      question = FactoryBot.build(:question, choice_min_word: "a" * 31)
      expect(question).to be_invalid

      question = FactoryBot.build(:question, choice_min_word: "下限文言")
      expect(question).to be_valid
    end

    example "choice_max_wordは必須、かつ30文字以内" do
      question = FactoryBot.build(:question, choice_max_word: "")
      expect(question).to be_invalid

      question = FactoryBot.build(:question, choice_max_word: "a" * 31)
      expect(question).to be_invalid

      question = FactoryBot.build(:question, choice_max_word: "上限文言")
      expect(question).to be_valid
    end

    example "point_reversalはtrue,またはfalse" do
      question = FactoryBot.build(:question, point_reversal: "")
      expect(question).to be_invalid

      question = FactoryBot.build(:question, point_reversal: nil)
      expect(question).to be_invalid

      question = FactoryBot.build(:question, point_reversal: true)
      expect(question).to be_valid

      question = FactoryBot.build(:question, point_reversal: false)
      expect(question).to be_valid
    end
  end

  describe "モデルのメソッド" do
    let!(:psychology_test) { FactoryBot.create(:psychology_test) }
    let!(:psychology_test2) { FactoryBot.create(:psychology_test, title: "心理テスト2") }
    let!(:personality) { FactoryBot.create(:personality, psychology_test: psychology_test) }
    let!(:personality2) { FactoryBot.create(:personality, psychology_test: psychology_test2) }
    let!(:question) { FactoryBot.create(:question, personality: personality) }
    let!(:question2) { FactoryBot.create(:question, personality: personality2) }

    example "scoped_by_testメソッドで特定のテストに紐づいた設問を抽出できる" do
      scoped_questions = Question.scoped_by_test(psychology_test)
      expect(scoped_questions.count).to eq(1)
      expect(scoped_questions.first).to eq(question)
      expect(scoped_questions.first).not_to eq(question2)
    end
  end
end
