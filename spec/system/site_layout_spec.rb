require 'rails_helper'

describe 'レイアウト', type: :system do
  it 'ログインしていない場合' do
    visit root_path
    expect(page).to have_selector 'a', text: 'ログイン'
    expect(page).to have_selector 'a', text: 'ユーザー登録'
    expect(page).to have_selector 'a', text: 'テストユーザーでログイン'
    expect(page).not_to have_selector 'a', text: '利用者一覧'
    expect(page).not_to have_selector 'a', text: 'プロフィール'
    expect(page).not_to have_selector 'a', text: '設定'
    expect(page).not_to have_selector 'a', text: 'ログアウト'
  end

  it 'ログインしている場合' do
    @user = FactoryBot.create(:user)
    log_in_as(@user)
    expect(page).to have_selector 'a', text: '利用者一覧'
    expect(page).to have_selector 'a', text: 'プロフィール'
    expect(page).to have_selector 'a', text: '設定'
    expect(page).to have_selector 'a', text: 'ログアウト'
    expect(page).not_to have_selector 'a', text: 'ログイン'
    expect(page).not_to have_selector 'a', text: 'ユーザー登録'
    expect(page).not_to have_selector 'a', text: 'テストユーザーでログイン'
  end
end
