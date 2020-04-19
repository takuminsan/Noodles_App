require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "post interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # 無効な送信
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { shop_name: "",
                                           nearest: "",
                                           content: "" } }
    end
    assert_select 'div#error_explanation'
    # 有効な送信
    shop_name = "ラーメンNoodle"
    nearest = "新宿駅"
    content = "美味しいね"
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { shop_name: shop_name,
                                           nearest: nearest,
                                           content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match shop_name, response.body
    assert_match nearest, response.body
    # 投稿を削除する
    assert_select 'a', text: '削除'
    first_post = @user.posts.paginate(page: 1).first
    assert_difference 'Post.count', -1 do
      delete post_path(first_post)
    end
    # 投稿を編集する
    
    # 違うユーザーのプロフィールにアクセス (削除リンクがないことを確認)
    get user_path(users(:archer))
    assert_select 'a', text: '削除', count: 0
    assert_select 'a', text: '編集', count: 0
    # 投稿がないユーザーのプロフィールにアクセス
    get user_path(users(:lana))
    assert_select 'h3', text: 'Lana Kaneの投稿はありません。'
  end
end
