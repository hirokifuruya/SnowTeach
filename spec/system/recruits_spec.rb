require 'rails_helper'

RSpec.describe "Recruits", type: :system do
  describe "投稿する場合" do
    let!(:instructor_user) { FactoryBot.create(:instructor_user) }
    let(:recruit) { FactoryBot.create(:recruit, user: instructor_user) }

    # before do
    #   sign_in instructor_user
    # end

    context "投稿に成功する" do
      it "正常なパラメータを送信すると投稿に成功すること" do
        sign_in instructor_user
        visit new_recruit_path
        fill_in 'recruit[name]', with: "テスト投稿"
        fill_in 'recruit[money]', with: "10000円"
        fill_in 'recruit[detail]', with: "テスト投稿の詳細"
        fill_in 'recruit[start_day]', with: "002023/02/27"
        fill_in 'recruit[end_day]', with: "002023/02/28"
        select "かぐらスキー場", from: 'recruit[skiresort_id]'
        click_button "登録"
        expect(page).to have_content "投稿詳細"
      end
    end

    context "ログインしていない場合" do
      it "ログイン画面にリダイレクトされる" do
        visit new_recruit_path
        #binding.pry
        expect(page).to have_content "ログインもしくはアカウント登録してください。"
      end
    end

    context "一覧表示" do
      it "投稿がある場合、一覧が表示されること" do
        sign_in instructor_user
        visit recruits_path
        sleep(5)
        expect(page).to have_content "平野"
      end
    end
  end
end