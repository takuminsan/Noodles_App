require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "profile display" do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'a', text: "投稿 (#{@user.posts.count})"
    assert_select 'a', text: "食べたい！(#{@user.likes.count})"
    assert_match @user.posts.count.to_s, response.body
    assert_select 'div.pagination'
  end
end
