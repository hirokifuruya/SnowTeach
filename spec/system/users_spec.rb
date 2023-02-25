require 'rails_helper'

# Users新規登録
RSpec.describe "Users", type: :system do
  it 'ユーザーを登録できること' do
    visit new_user_registration_path
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    select_option = find("select[name='user[role_id]'] option[value='2']")
    select_option.select_option
    click_button 'アカウント登録'
    expect(page).to have_content 'アカウント登録が完了しました。'
  end

  it '不正な値では登録できないこと' do
    visit new_user_registration_path
    fill_in 'user[email]', with: ''
    fill_in 'user[password]', with: ''
    click_button 'アカウント登録'
    expect(page).to have_content 'Emailを入力してください'
    expect(page).to have_content 'Passwordを入力してください'
  end
end

# Usersログイン
RSpec.describe 'Users', type: :system do
  let(:user) { create(:user, role: create(:role)) }

  it 'ログインできること' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました。'
  end

  it '不正な値ではログインできないこと' do
    visit new_user_session_path
    fill_in 'user[email]', with: ''
    fill_in 'user[password]', with: ''
    click_button 'ログイン'
    expect(page).to have_content 'Emailまたはパスワードが違います。'
  end
end
