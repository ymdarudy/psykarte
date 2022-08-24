require "rails_helper"

RSpec.describe PsychologyTest, type: :model do
  describe "validation" do
    example "titleは必須、かつ255文字以下" do
      psychology_test = FactoryBot.build(:psychology_test, title: "")
      expect(psychology_test).to be_invalid

      psychology_test = FactoryBot.build(:psychology_test, title: "a" * 256)
      expect(psychology_test).to be_invalid

      psychology_test = FactoryBot.build(:psychology_test, title: "タイトル")
      expect(psychology_test).to be_valid
    end

    example "descriptionは必須" do
      psychology_test = FactoryBot.build(:psychology_test, description: "")
      expect(psychology_test).to be_invalid

      psychology_test = FactoryBot.build(:psychology_test, description: "説明")
      expect(psychology_test).to be_valid
    end

    example "referrerは必須" do
      psychology_test = FactoryBot.build(:psychology_test, referrer: "")
      expect(psychology_test).to be_invalid

      psychology_test = FactoryBot.build(:psychology_test, referrer: "参照元")
      expect(psychology_test).to be_valid
    end
  end

  # describe "モデルのメソッド" do
  #   example "scoped_by_userメソッドで特定のユーザーが回答済みの心理テストを抽出できる" do
  #     user = User.guest
  #     expect(user.name).to eq("ゲスト")
  #     expect(user.email).to eq("guest@example.com")
  #     expect(user.admin).to eq(false)
  #   end
  #   example "scoped_by_user_unansweredメソッドで所定のユーザーが作成できる" do
  #     user = User.guest_admin
  #     expect(user.name).to eq("ゲスト管理者")
  #     expect(user.email).to eq("guestadmin@example.com")
  #     expect(user.admin).to eq(true)
  #   end
  # end
end
