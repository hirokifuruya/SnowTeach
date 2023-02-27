require 'rails_helper'

RSpec.describe "Favorites", type: :system do
  describe "お気に入り機能" do
  let(:instructor_user) { FactoryBot.create(:instructor_user) }
  let(:general_user) { FactoryBot.create(:general_user) }
  let!(:recruit) { FactoryBot.create(:recruit, user: instructor_user) }

    before do
      sign_in general_user
    end

    context 'お気に入りしたい場合' do
      it "お気に入りに追加できること" do
        click_on "投稿一覧画面"
        visit recruit_path(recruit)
        click_on "お気に入りする"
        click_on "お気に入りを表示する"
        expect(page).to have_content "宮澤"
      end
    end
    context 'お気に入り削除する場合' do
      it "お気に入りから削除できること" do
        click_on "お気に入りする"
        click_on "投稿一覧画面"
        visit recruit_path(recruit)
        click_on "お気に入り解除"
        click_on "お気に入りを表示する"
        expect(page).to have_content ""
      end
    end

    before do
      visit recruit_path(recruit)
    end

    context "お気に入り出来ない場合" do
      it "お気に入りに追加できないこと" do
        expect(page).to_not have_content "お気に入り登録"
      end
    end

    context "お気に入り削除出来ない場合" do
      it "お気に入りから削除できないこと" do
        expect(page).to_not have_content "お気に入り解除"
      end
    end
  end
end