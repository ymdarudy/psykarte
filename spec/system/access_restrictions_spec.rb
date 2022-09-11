require "rails_helper"
require "system/helper"
include RSpecHelper

RSpec.describe "アクセス制限機能", type: :system do
  let!(:user) { create(:user, admin: false) }
  let!(:admin_user) { create(:user, name: "admin", email: "admin@example.com", admin: true) }
  describe "一般ページのアクセス制限" do
    it "一般ユーザーでは他のユーザーのマイページにアクセスできない" do
      log_in(user)
      visit user_path(admin_user)
      expect(page).to have_content "他のユーザーページにはアクセスできません。"
      expect(current_path).to eq root_path
    end

    it "管理者ユーザーは他のユーザーのマイページにアクセスできる" do
      log_in(admin_user)
      visit user_path(user)
      expect(current_path).to eq user_path(user)
    end
  end

  describe "管理者ページのアクセス制限" do
    it "一般ユーザーは管理者ページにアクセスできない" do
      log_in(user)
      visit rails_admin_path
      expect(page).to have_content "You are not authorized to access this page."
    end

    it "管理者ユーザーは管理者ページにアクセスできる" do
      log_in(admin_user)
      visit rails_admin_path
      expect(page).to have_content "サイト管理"
      expect(current_path).to eq rails_admin_path
    end
  end
end
