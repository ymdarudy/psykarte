require "rails_helper"
require "system/helper"
include RSpecHelper

RSpec.describe "CRUD機能", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:category1) { FactoryBot.create(:category, name: "カテゴリ1", id: 1) }
  let!(:category2) { FactoryBot.create(:category, name: "カテゴリ2", id: 2) }
  let!(:psychology_test1) { FactoryBot.create(:psychology_test, title: "心理テスト1", description: "説明1", referrer: "参照元1", category_ids: [1]) }
  let!(:psychology_test2) { FactoryBot.create(:psychology_test, title: "心理テスト2", description: "説明2", referrer: "参照元2", category_ids: [2]) }
  let!(:personality1) { FactoryBot.create(:personality, psychology_test: psychology_test1) }
  let!(:personality2) { FactoryBot.create(:personality, psychology_test: psychology_test2) }
  let!(:question1_1) { FactoryBot.create(:question, personality: personality1, title: "設問1-1") }
  let!(:question1_2) { FactoryBot.create(:question, personality: personality1, title: "設問1-2") }
  let!(:question2) { FactoryBot.create(:question, personality: personality2, title: "設問2") }

  describe "心理テスト回答関連" do
    before { log_in(user) }
    it "「心理テスト一覧」をクリックすると心理テストの一覧が表示される" do
      click_on "psychology_tests"
      expect(page).to have_content "心理テスト1"
      expect(page).to have_content "心理テスト2"
      expect(current_path).to eq psychology_tests_path
    end

    it "心理テストのタイトルをクリックすると回答ページにとび、全設問が表示される" do
      visit psychology_tests_path
      click_on "心理テスト1"
      expect(page).to have_content "設問1-1"
      expect(page).to have_content "設問1-2"
      expect(current_path).to eq psychology_test_path(psychology_test1.id)
    end

    it "心理テストに全問回答すると回答詳細ページにとぶ" do
      visit psychology_test_path(psychology_test1)
      check1 = question1_1.id
      check2 = question1_2.id
      choose "answer_#{check1}_0"
      choose "answer_#{check2}_1"
      click_on "登録する"
      expect(page).to have_content "回答を記録しました。"
      expect(current_path).to eq answer_path(psychology_test1.id)
    end

    it "心理テストのチェックに不足があると回答ページに戻される" do
      visit psychology_test_path(psychology_test1)
      check1 = question1_1.id
      choose "answer_#{check1}_0"
      click_on "登録する"
      expect(page).to have_content "未回答の設問がありました。すべて回答してください。"
      expect(current_path).to eq psychology_test_path(psychology_test1.id)
    end

    it "マイページに回答結果が表示される" do
      FactoryBot.create(:answer, question: question1_1, user: user, point: 1)
      FactoryBot.create(:answer, question: question1_2, user: user, point: 2)
      visit user_path(user)
      expect(page).to have_content "心理テスト1"
      expect(page).to have_content "回答日時"
    end
  end

  describe "お気に入り・検索関連" do
    before { log_in(user) }
    context "心理テスト一覧ページにて" do
      before { visit psychology_tests_path }
      it "お気に入り登録、お気に入り解除ができる" do
        expect(Favorite.count).to eq 0
        first(".fav-on").click
        sleep 0.5
        expect(Favorite.count).to eq 1
        first(".fav-off").click
        sleep 0.5
        expect(Favorite.count).to eq 0
      end

      it "タイトルであいまい検索ができる" do
        fill_in "q_title_or_description_or_referrer_cont", with: "テスト1"
        click_on "検索"
        expect(page).to have_content "心理テスト1"
        expect(page).not_to have_content "心理テスト2"
      end

      it "説明であいまい検索ができる" do
        fill_in "q_title_or_description_or_referrer_cont", with: "明1"
        click_on "検索"
        expect(page).to have_content "心理テスト1"
        expect(page).not_to have_content "心理テスト2"
      end

      it "参照元であいまい検索ができる" do
        fill_in "q_title_or_description_or_referrer_cont", with: "照元1"
        click_on "検索"
        expect(page).to have_content "心理テスト1"
        expect(page).not_to have_content "心理テスト2"
      end

      it "カテゴリ検索ができる（OR検索）" do
        check "q_categories_id_in_1"
        click_on "検索"
        expect(page).to have_content "心理テスト1"
        expect(page).not_to have_content "心理テスト2"
        check "q_categories_id_in_2"
        click_on "検索"
        expect(page).to have_content "心理テスト1"
        expect(page).to have_content "心理テスト2"
      end

      it "タイトル&カテゴリで検索ができる(タイトルとカテゴリはAND、カテゴリ部分だけはOR" do
        fill_in "q_title_or_description_or_referrer_cont", with: "テスト1"
        check "q_categories_id_in_2"
        click_on "検索"
        expect(page).not_to have_content "心理テスト1"
        expect(page).not_to have_content "心理テスト2"
        check "q_categories_id_in_1"
        click_on "検索"
        expect(page).to have_content "心理テスト1"
        expect(page).not_to have_content "心理テスト2"
      end

      it "未回答の心理テストだけ表示できる" do
        FactoryBot.create(:answer, question: question1_1, user: user, point: 1)
        FactoryBot.create(:answer, question: question1_2, user: user, point: 2)
        click_link "未回答のみ表示"
        expect(page).not_to have_content "心理テスト1"
        expect(page).to have_content "心理テスト2"
      end

      it "お気に入りの心理テストだけ表示できる" do
        first(".fav-on").click
        click_link "お気に入りのみ表示"
        expect(page).to have_content "心理テスト1"
        expect(page).not_to have_content "心理テスト2"
      end

      it "検索後に表示リセットボタンで全ての心理テストを表示できる" do
        fill_in "q_title_or_description_or_referrer_cont", with: "テスト1"
        click_on "検索"
        expect(page).to have_content "心理テスト1"
        expect(page).not_to have_content "心理テスト2"
        click_on "表示リセット"
        expect(page).to have_content "心理テスト1"
        expect(page).to have_content "心理テスト2"
      end
    end
  end
end
