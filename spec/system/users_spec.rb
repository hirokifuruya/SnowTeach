require 'rails_helper'

# Users新規登録
RSpec.describe "Users", type: :system do
  describe "ユーザ登録機能" do
  FactoryBot.create(:admin)
  FactoryBot.create(:instructor)
  FactoryBot.create(:general)

    context "正しく入力された場合" do
      it 'ユーザーを登録できること' do
        visit new_user_registration_path
        fill_in 'user[name]', with: '古谷'
        fill_in 'Eメール', with: 'test@example.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        select '一般ユーザー', from: 'user[role_id]'
        click_button 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
    context "不正な値の場合" do
      it '登録できないこと' do
        visit new_user_registration_path
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'アカウント登録'
        expect(page).to have_content 'Eメールを入力してください'
        expect(page).to have_content 'パスワードを入力してください'
      end
    end
  end
end


# Usersログイン
RSpec.describe 'Users', type: :system do
  describe "ユーザーログイン機能" do
  let!(:admin_user) { create(:admin_user, role: create(:admin)) }
  context "ユーザーの場合"
    it 'ログインできること' do
      visit new_user_session_path
      fill_in 'user[email]', with: admin_user.email
      fill_in 'user[password]', with: admin_user.password
      click_button 'ログイン'
      expect(page).to have_content 'ログインしました。'
    end
  end
  context "違うユーザーの場合" do
    it '不正な値ではログインできないこと' do
      visit new_user_session_path
      fill_in 'Eメール', with: ''
      fill_in 'パスワード', with: ''
      click_button 'ログイン'
      expect(page).to have_content 'Eメールまたはパスワードが違います。'
    end
  end
end
