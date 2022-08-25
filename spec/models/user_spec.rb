require "rails_helper"

RSpec.describe User, type: :model do
  describe "validation" do
    example "nameは必須、かつ50文字以下" do
      user = FactoryBot.build(:user, name: "")
      expect(user).to be_invalid

      user = FactoryBot.build(:user, name: "a" * 51)
      expect(user).to be_invalid

      user = FactoryBot.build(:user, name: "山田")
      expect(user).to be_valid
    end

    example "emailは必須、かつ所定のフォーマット、かつユニーク" do
      user = FactoryBot.build(:user, email: "")
      expect(user).to be_invalid

      user = FactoryBot.build(:user, email: "test")
      expect(user).to be_invalid

      user = FactoryBot.build(:user, email: "test@example")
      expect(user).to be_invalid

      user = FactoryBot.build(:user, email: "test@example.com")
      expect(user).to be_valid

      user = FactoryBot.create(:user, email: "test@example.com")
      user2 = FactoryBot.build(:user, email: "Test@example.com")
      expect(user2).to be_invalid
    end

    example "passwordは必須、6文字以上" do
      user = FactoryBot.build(:user, password: "")
      expect(user).to be_invalid

      user = FactoryBot.build(:user, password: "a" * 5)
      expect(user).to be_invalid

      user = FactoryBot.build(:user, password: "password")
      expect(user).to be_valid
    end
  end

  describe "モデルのメソッド" do
    example "guestメソッドで所定のユーザーが作成できる" do
      user = User.guest
      expect(user.name).to eq("ゲスト")
      expect(user.email).to eq("guest@example.com")
      expect(user.admin).to eq(false)
    end
    example "guest_adminメソッドで所定のユーザーが作成できる" do
      user = User.guest_admin
      expect(user.name).to eq("ゲスト管理者")
      expect(user.email).to eq("guestadmin@example.com")
      expect(user.admin).to eq(true)
    end
  end
end
