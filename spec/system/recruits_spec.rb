require 'rails_helper'

RSpec.describe "Recruits", type: :system do
  describe "新規投稿", type: :system do
    let(:instructor_user) { FactoryBot.create(:instructor_user) }

    before do
      FactoryBot.create(:naeba)
      sign_in instructor_user
      visit new_recruit_path
    end

    it "投稿に成功する" do
      fill_in 'recruit[name]', with: "テスト投稿"
      fill_in 'recruit[money]', with: "10000円"
      fill_in 'recruit[detail]', with: "テスト投稿の詳細"
      fill_in 'recruit[start_day]', with: "002023/02/27"
      fill_in 'recruit[end_day]', with: "002023/02/28"
      select "苗場スキー場", from: 'recruit[skiresort_id]'
      click_button "登録"
      expect(page).to have_content "投稿詳細"
    end

    context "ログインしていない場合" do
      before do
        sign_out instructor_user
        #binding.pry
      end

      it "ログイン画面にリダイレクトされる" do
        #binding.pry
        visit new_recruit_path
        #binding.pry
        expect(page).to have_content "ログインもしくはアカウント登録してください。"
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
