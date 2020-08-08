require 'rails_helper'

describe 'レイアウト', type: :system do
  it 'ログインしていない場合' do
    visit root_path
    expect(page).to have_selector 'a', text: 'ログイン'
    expect(page).to have_selector 'a', text: 'ユーザー登録'
    expect(page).not_to have_selector 'a', text: '利用者一覧'
    expect(page).not_to have_selector 'a', text: 'アカウント'
  end

  it 'ログインしている場合' do
    @user = FactoryBot.create(:user)
    visit login_path
    fill_in 'session_email', with: @user.email
    fill_in 'session_password', with: 'password'
    click_button 'ログイン'
    expect(page).to have_selector 'a', text: '利用者一覧'
    expect(page).to have_selector 'a', text: 'アカウント'
    expect(page).not_to have_selector 'a', text: 'ログイン'
    expect(page).not_to have_selector 'a', text: 'ユーザー登録'
  end
end
