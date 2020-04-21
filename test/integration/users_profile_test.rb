require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'h3', text: "#{@user.name}の投稿 (#{@user.posts.count})"
    assert_match @user.posts.count.to_s, response.body
    assert_select 'div.pagination'
  end
end
