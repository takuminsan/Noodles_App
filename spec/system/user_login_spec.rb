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

  it '有効な情報でログインできること(ログアウトも含む)' do
    visit login_path
    fill_in 'session_email', with: @user.email
    fill_in 'session_password', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content @user.name
    expect(page).not_to have_selector 'a', text: 'ログイン'
    expect(page).to have_content '投稿する'
    find('.dropdown-toggle').click
    click_on 'ログアウト'
    expect(page).to have_selector 'a', text: 'ログイン'
    expect(page).not_to have_content '投稿する'
  end

  it 'ログイン状態の保持(ログアウトしたらcookiesは削除される)' do
    # クッキーを保存してログイン
    visit login_path
    fill_in 'session_email', with: @user.email
    fill_in 'session_password', with: 'password'
    check 'ログイン状態を保持'
    click_button 'ログイン'
    expect([cookies['remember_token']]).not_to be_empty
    find('.dropdown-toggle').click
    click_on 'ログアウト'
    # クッキーを削除してログイン
    visit login_path
    fill_in 'session_email', with: @user.email
    fill_in 'session_password', with: 'password'
    click_button 'ログイン'
    expect([cookies['remember_token']]).to eq [nil]
  end
end
