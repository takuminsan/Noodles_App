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
    wait_for_ajax do # spec/supports/test_helper.rb
      expect(@user.reload.following.count).to eq 1
      expect(@other.reload.followers.count).to eq 1
      expect(page).to have_button 'フォロー解除'
    end
    # followingページにフォロー中のユーザーが表示されること
    visit following_user_path(@user)
    expect(page).to have_link 'other'
    # followersページにフォローされているユーザーが表示されること
    visit followers_user_path(@other)
    expect(page).to have_link 'テストユーザー'
    # フォロー解除ボタンを押す
    visit user_path(@other)
    click_button 'フォロー解除'
    wait_for_ajax # spec/supports/test_helper.rb
    expect(@user.following.count).to eq 0
    expect(@other.followers.count).to eq 0
  end
end
