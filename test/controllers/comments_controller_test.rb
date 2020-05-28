require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @post = posts(:one)
    @comment = comments(:two)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Comment.count' do
      post post_comments_path(@post.id), params: { comment: { content: "good." } }
      assert_not flash.empty?
      assert_redirected_to login_url
    end
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Comment.count' do
      delete post_comment_path(@post.id, @comment.id)
    end
    assert_redirected_to login_url
  end
end
