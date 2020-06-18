require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @post = @user.posts.build(shop_name: "Noodles",
                              nearest: "sinjuku-station",
                              content: "ラーメン美味しい")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "shop_name should be present" do
    @post.shop_name = "   "
    assert_not @post.valid?
  end

  test "nearest should be present" do
    @post.nearest = "   "
    assert_not @post.valid?
  end

  test "content should be at most 1000 characters" do
    @post.content = "a" * 1001
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.recent.first
  end
end
