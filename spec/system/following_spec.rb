require 'rails_helper'

describe 'フォロー', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @other = FactoryBot.create(:user, email: 'other@example.com', name: 'other')
    log_in_as(@user)
  end

  it 'フォローボタンが正常に動作すること' do
    # フォローするボタンを押す
    visit user_path(@other)
    click_button 'フォローする'
    # followingページにフォロー中のユーザーが表示されること
    visit following_user_path(@user)
    expect(page).to have_link 'other'
    # followersページにフォローされているユーザーが表示されること
    visit followers_user_path(@other)
    expect(page).to have_link 'テストユーザー'
    # フォロー解除ボタンを押す
    visit user_path(@other)
    click_button 'フォロー解除'
    visit following_user_path(@user)
    expect(page).not_to have_link 'other'
    visit followers_user_path(@other)
    expect(page).not_to have_link 'テストユーザー'
  end
end
