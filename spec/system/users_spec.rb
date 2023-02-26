require 'rails_helper'

# Users新規登録
RSpec.describe "Users", type: :system do
  FactoryBot.create(:admin)
  FactoryBot.create(:instructor)
  FactoryBot.create(:general)

  it 'ユーザーを登録できること' do
    visit new_user_registration_path
    fill_in 'Eメール', with: 'test@example.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    select '一般ユーザー', from: 'user_role_id'
    click_button 'アカウント登録'
    expect(page).to have_content 'アカウント登録が完了しました。'
  end

  it '不正な値では登録できないこと' do
    visit new_user_registration_path
    fill_in 'user[email]', with: ''
    fill_in 'user[password]', with: ''
    click_button 'アカウント登録'
    expect(page).to have_content 'Eメールを入力してください'
    expect(page).to have_content 'パスワードを入力してください'
  end
end


# Usersログイン
RSpec.describe 'Users', type: :system do
  let(:admin_user) { create(:admin_user, role: create(:admin)) }

  it 'ログインできること' do
    visit new_user_session_path
    fill_in 'user[email]', with: admin_user.email
    fill_in 'user[password]', with: admin_user.password
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました。'
  end

  it '不正な値ではログインできないこと' do
    visit new_user_session_path
    fill_in 'Eメール', with: ''
    fill_in 'パスワード', with: ''
    click_button 'ログイン'
    expect(page).to have_content 'Eメールまたはパスワードが違います。'
  end
end
