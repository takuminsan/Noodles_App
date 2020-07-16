require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @post = FactoryBot.create(:post)
  end

  context "ログインしていないとき" do
    it "コメント作成は行われず、ログイン画面へリダイレクトされる" do
      comment_params = FactoryBot.attributes_for(:comment, post: @post) # ファクトリからcommentデータをハッシュで受け取り、変数comment_paramsに代入
      post :create, params: { comment: comment_params }
      expect(response).to redirect_to login_url
    end
  end
end

#require 'test_helper'
#
#class CommentsControllerTest < ActionDispatch::IntegrationTest
#  def setup
#    @post = posts(:one)
#    @comment = comments(:two)
#  end
#
#  test "should redirect create when not logged in" do
#    assert_no_difference 'Comment.count' do
#      post post_comments_path(@post.id), params: { comment: { content: "good." } }
#      assert_not flash.empty?
#      assert_redirected_to login_url
#    end
#  end
#
#  test "should redirect destroy when not logged in" do
#    assert_no_difference 'Comment.count' do
#      delete post_comment_path(@post.id, @comment.id)
#    end
#    assert_redirected_to login_url
#  end
#end
