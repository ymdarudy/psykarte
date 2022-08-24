require "rails_helper"

RSpec.describe User, type: :model do
  describe "validation" do
    example "nameは必須、かつ50文字以下" do
      user = User.new(name: "", email: "test@example.com", password: "password")
      expect(user).to be_invalid

      user = User.new(name: "a" * 51, email: "test@example.com", password: "password")
      expect(user).to be_invalid

      user = User.new(name: "山田", email: "test@example.com", password: "password")
      expect(user).to be_valid
    end

    example "emailは必須、かつ所定のフォーマット" do
      user = User.new(name: "山田", email: "", password: "password")
      expect(user).to be_invalid

      user = User.new(name: "山田", email: "test", password: "password")
      expect(user).to be_invalid

      user = User.new(name: "山田", email: "test@example", password: "password")
      expect(user).to be_invalid

      user = User.new(name: "山田", email: "test@example.com", password: "password")
      expect(user).to be_valid
    end

    example "passwordは必須、6文字以上" do
      user = User.new(name: "山田", email: "test@example.com", password: "")
      expect(user).to be_invalid

      user = User.new(name: "山田", email: "test@example.com", password: "a" * 5)
      expect(user).to be_invalid

      user = User.new(name: "山田", email: "test@example.com", password: "password")
      expect(user).to be_valid
    end
  end
end
