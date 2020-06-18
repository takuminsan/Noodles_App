require 'test_helper'

class CommentsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @post = posts(:two)
  end

  test "comment interface" do
    log_in_as(@user)
    # 無効な送信
    get post_path(@post.id)
    assert_no_difference 'Comment.count' do
      post post_comments_path(@post.id), params: { comment: { content: "",
                                                              user_id: nil,
                                                              post_id: nil } }
    end
    assert_select 'div#error_explanation'
    # 有効な送信
    get post_path(@post.id)
    assert_difference 'Comment.count', 1 do
      post post_comments_path(@post.id), params: { comment: { content: "いいね！",
                                                              user_id: @user.id,
                                                              post_id: @post.id } }
    end
  end
end
