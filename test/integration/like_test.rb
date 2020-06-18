require 'test_helper'

class LikeTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @post = posts(:one)
    log_in_as(@user)
  end

  test "likes page" do
    @post.like(@user)
    assert_not @user.likes.empty?
    get likes_user_path(@user)
    assert_match @user.likes.count.to_s, response.body
    assert_match @post.content, response.body
  end

  test "should like a post the standard way" do
    assert_difference '@user.likes.count', 1 do
      post likes_path, params: { user_id: @user.id,
                                 post_id: @post.id }
    end
  end

  test "should like a post with Ajax" do
    assert_difference '@user.likes.count', 1 do
      post likes_path, xhr: true, params: { user_id: @user.id,
                                            post_id: @post.id }
    end
  end

  test "should unlike a post the standard way" do
    @post.like(@user)
    like = @user.likes.find_by(post_id: @post.id)
    assert_difference '@user.likes.count', -1 do
      delete like_path(like)
    end
  end

  test "should unlike a post with Ajax" do
    @post.like(@user)
    like = @user.likes.find_by(post_id: @post.id)
    assert_difference '@user.likes.count', -1 do
      delete like_path(like), xhr: true
    end
  end
end
