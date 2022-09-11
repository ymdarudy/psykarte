require "rails_helper"

RSpec.describe Answer, type: :model do
  describe "validation" do
    example "pointは必須、かつ整数のみ" do
      answer = build(:answer, point: "")
      expect(answer).to be_invalid

      answer = build(:answer, point: 1.5)
      expect(answer).to be_invalid

      answer = build(:answer, point: 2)
      expect(answer).to be_valid
    end
  end

  describe "モデルのメソッド" do
    let!(:user) { create(:user, email: "answertest@example.com") }
    let!(:user2) { create(:user, name: "user2", email: "answertest2@example.com") }
    let!(:psychology_test) { create(:psychology_test) }
    let!(:psychology_test2) { create(:psychology_test, title: "心理テスト2") }
    let!(:personality) { create(:personality, psychology_test: psychology_test) }
    let!(:personality2) { create(:personality, psychology_test: psychology_test2) }
    let!(:question) { create(:question, personality: personality) }
    let!(:question2) { create(:question, personality: personality2) }
    let!(:answer) { create(:answer, question: question, user: user, created_at: "2022-08-25 12:00", point: 1) }
    let!(:answer2) { create(:answer, question: question2, user: user2, created_at: "2022-08-25 12:00", point: 2) }
    let!(:answer3) { create(:answer, question: question, user: user, created_at: "2022-08-30 15:00", point: 5) }

    example "scoped_by_psychology_testメソッドで特定のテストに紐づいた回答を抽出できる" do
      scoped_answers = Answer.scoped_by_psychology_test(psychology_test)
      expect(scoped_answers.count).to eq(2)
      expect(scoped_answers.first).to eq(answer)
      expect(scoped_answers.second).to eq(answer3)
      expect(scoped_answers.first).not_to eq(answer2)
    end

    example "scoped_by_personalityメソッドで特定の心理傾向に紐づいた回答を抽出できる" do
      scoped_answers = Answer.scoped_by_personality(personality)
      expect(scoped_answers.count).to eq(2)
      expect(scoped_answers.first).to eq(answer)
      expect(scoped_answers.second).to eq(answer3)
      expect(scoped_answers.first).not_to eq(answer2)
    end

    example "answered_timesメソッドで回答日時（YYYYMMDD-HH:MM）の配列を抽出できる" do
      times = Answer.answered_times
      expect(times.size).to eq(2)
      expect(times).to eq(["2022-08-25 12:00", "2022-08-30 15:00"])
      expect(times).not_to eq(["2022-08-30 15:00", "2022-08-25 12:00"])
      expect(times).not_to eq(["2022-08-25 00:00", "2022-08-30 00:00"])
    end

    example "points_with_answered_timesメソッドで回答日時（YYYYMMDD-HH:MM）ごとにポイントと回答日時を抽出できる" do
      points_with_times = Answer.points_with_answered_times
      expect(points_with_times.keys).to eq(["2022-08-25 12:00", "2022-08-30 15:00"])
      expect(points_with_times["2022-08-25 12:00"].collect(&:point)).to eq([1, 2])
      expect(points_with_times["2022-08-30 15:00"].collect(&:point)).to eq([5])
      expect(points_with_times["2022-08-30 15:00"].collect(&:point)).not_to eq([1, 2])
    end
  end
end
