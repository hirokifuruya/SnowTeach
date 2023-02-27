require 'rails_helper'

RSpec.describe "Request", type: :system do
  describe "予約に関するテスト" do
  let(:instructor_user) { FactoryBot.create(:instructor_user) }
  let(:general_user) { FactoryBot.create(:general_user) }
  let!(:recruit) { FactoryBot.create(:recruit, user: instructor_user) }
    before do
      sign_in general_user
      visit recruit_path(recruit)
    end

    context '一般ユーザーがログインしている場合' do
      it "自分が予約したものが表示されること" do
        click_link('予約する', match: :first)
        click_on "予約を確定する"
        visit user_session_path
        check '表示する'
        expect(page).to have_content "テスト投稿"
      end
    end

    context '一般ユーザーの場合' do
      it "自分が予約した物をキャンセルする" do
        click_link('予約する', match: :first)
        click_on "予約を確定する"
        visit user_session_path
        check '表示する'
        click_link '削除'
        sleep(1)
        page.accept_confirm
        visit user_session_path
        expect(page).to have_content "現在、予約した募集はありません。"
      end
    end
  end
end

