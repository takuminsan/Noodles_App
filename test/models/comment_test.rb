require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @post = posts(:one)
    @comment = @user.comments.build(post_id: @post.id,
                                    content: "いいね！")
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "user id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "post id should be present" do
    @comment.post_id = nil
    assert_not @comment.valid?
  end

  test "content should be present" do
    @comment.content = " "
    assert_not @comment.valid?
  end

  test "content should be at most 200 characters" do
    @comment.content = "a" * 201
    assert_not @comment.valid?
  end
end
