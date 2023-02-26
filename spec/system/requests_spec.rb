require 'rails_helper'

RSpec.describe "Requests", type: :system do
  let(:instructor_user) { FactoryBot.create(:instructor_user) }
  let(:general_user) { FactoryBot.create(:general_user) }
  let!(:recruit) { FactoryBot.create(:recruit, user: instructor_user) }

  describe "ログインしている場合" do
    before do
      sign_in general_user
      visit recruit_path(recruit)
    end

    it "お気に入りに追加できること" do
      click_on "お気に入りする"
      click_on "お気に入りを表示する"
      expect(page).to have_content "user1@dive.com"
    end

    it "お気に入りから削除できること" do
      click_on "お気に入りする"
      click_on "投稿一覧画面"
      visit recruit_path(recruit)
      click_on "お気に入り解除"
      click_on "お気に入りを表示する"
      expect(page).to have_content ""
    end
  end

  describe "ログインしていない場合" do
    before do
      visit recruit_path(recruit)
    end

    it "お気に入りに追加できないこと" do
      expect(page).to_not have_content "お気に入り登録"
    end

    it "お気に入りから削除できないこと" do
      expect(page).to_not have_content "お気に入り解除"
    end
  end
end