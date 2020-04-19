require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @post = posts(:one)
  end

  test "should redirect new when not logged in" do
    get new_post_path
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get edit_post_path(@post)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { shop_name: "Noodles-01",
                                           nearest: "sinjuku-station",
                                           content: "美味しい！" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch post_path(@post), params: { post: { shop_name: "Noodles-01",
                                           nearest: "sinjuku-station",
                                           content: "美味しい！" } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Post.count' do
      delete post_path(@post)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong post" do
    log_in_as(users(:michael))
    post = posts(:six)
    assert_no_difference 'Post.count' do
      delete post_path(post)
    end
    assert_redirected_to root_url
  end
end
