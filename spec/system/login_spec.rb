require "rails_helper"
require "system/helper"
include RSpecHelper

RSpec.describe "新規登録・ログイン関連機能", type: :system do
  describe "新規登録関連" do
    it "新規登録できる" do
      visit new_user_registration_path
      fill_in :user_name, with: "山田"
      fill_in :user_email, with: "systemspec@example.com"
      fill_in :user_password, with: "123123"
      fill_in :user_password_confirmation, with: "123123"
      click_on "commit"
      expect(page).to have_content "アカウント登録が完了しました。"
    end
  end

  describe "ログイン関連" do
    let!(:user) { FactoryBot.create(:user) }
    it "通常ユーザーとしてログインできる" do
      log_in(user)
      expect(page).to have_content "ログインしました。"
      expect(current_path).to eq user_path(user)
    end

    it "ログイン後にログアウトできる" do
      log_in(user)
      click_on "ログアウト"
      expect(page).to have_content "ログアウトしました。"
      expect(current_path).to eq root_path
    end

    it "ゲストログインできる" do
      visit root_path
      click_on "ゲストログイン"
      expect(page).to have_content "ゲストユーザーとしてログインしました。"
      expect(page).to have_content "guest@example.com"
    end

    it "ゲスト管理者ログインできる" do
      visit root_path
      click_on "ゲスト管理者ログイン"
      expect(page).to have_content "ゲスト管理者ユーザーとしてログインしました。"
      expect(page).to have_content "guestadmin@example.com"
    end
  end
end
