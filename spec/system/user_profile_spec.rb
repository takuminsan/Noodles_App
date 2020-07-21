require 'rails_helper'

describe 'ユーザープロフィール', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ユーザープロフィールが表示されること' do
    visit login_path
    fill_in 'session_email', with: @user.email
    fill_in 'session_password', with: @user.password
    click_button 'ログイン'
    visit user_path(@user)
    expect(page).to have_content "投稿 (#{@user.posts.count})"
    expect(page).to have_content "食べたい！(#{@user.likes.count})"
  end
end
