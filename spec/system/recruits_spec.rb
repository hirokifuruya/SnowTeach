require 'rails_helper'

RSpec.describe "Recruits", type: :system do
  describe "新規投稿" do
    context "ログインしている場合" do
      let(:user) { create(:user, role: create(:role)) }
      let(:skiresort) { FactoryBot.create(:skiresort1) }

      before do
        sign_in user
        visit new_recruit_path
      end

      it "投稿に成功する" do
        fill_in 'recruit[name]', with: "テスト投稿"
        fill_in 'recruit[money]', with: "10000円"
        fill_in 'recruit[detail]', with: "テスト投稿の詳細"
        sleep(3)
        select skiresort.name, from: "スキー場"

        expect {
          click_button "登録"
        }.to change { Recruit.count }.by(1)

        expect(page).to have_content "募集を投稿しました。"
      end
    end

    context "ログインしていない場合" do
      it "ログイン画面にリダイレクトされる" do
        visit new_recruit_path
        expect(page).to have_current_path(new_user_session_path(locale: 'ja'))
        expect(page).to have_content "ログインしてください。"
      end
    end
  end

  describe "一覧表示" do
    let!(:recruit1) { FactoryBot.create(:recruit) }
    let!(:recruit2) { FactoryBot.create(:recruit) }

    it "一覧が表示される" do
      visit recruits_path
      expect(page).to have_content recruit1.name
      expect(page).to have_content recruit2.name
    end
  end
end


