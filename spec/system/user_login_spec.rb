require 'rails_helper'

describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it '有効な情報でなければログインできないこと' do
    visit login_path
    expect(page).to have_content 'ログイン'
    fill_in 'session_email', with: ''
    fill_in 'session_password', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content 'メールアドレスorパスワードが無効です。'
  end

  it '有効な情報でログインできること' do
    visit login_path
    fill_in 'session_email', with: @user.email
    fill_in 'session_password', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content @user.name
    expect(page).not_to have_selector 'li', text: ' ログイン'
    expect(page).to have_content '投稿する'
  end
end
