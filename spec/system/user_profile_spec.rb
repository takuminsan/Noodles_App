require 'rails_helper'

describe 'ユーザープロフィール', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ユーザープロフィールが表示されること' do
    log_in_as(@user)
    visit user_path(@user)
    expect(page).to have_content "投稿 (#{@user.posts.count})"
    expect(page).to have_content "食べたい！(#{@user.likes.count})"
  end
end

#
#  test "profile display" do
#    log_in_as(@user)
#    get user_path(@user)
#   assert_select 'a', text: "投稿 (#{@user.posts.count})"
#  assert_select 'a', text: "食べたい！(#{@user.likes.count})"
#    assert_match @user.posts.count.to_s, response.body
#    assert_select 'div.pagination'
#  end
#end
