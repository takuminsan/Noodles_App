require 'rails_helper'

describe '投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it '投稿一連のテスト' do
    log_in_as(@user)
    visit new_post_path
    # 無効な送信
    fill_in 'post_shop_name', with: ''
    fill_in 'post_nearest', with: ''
    fill_in 'post_content', with: ''
    click_button '投稿する'
    expect(page).to have_css '#error_explanation'
    # 有効な送信
    shop_name = "ラーメンNoodle"
    nearest = "新宿駅"
    content = "美味しいね"
    expect {
      fill_in 'post_shop_name', with: shop_name
      fill_in 'post_nearest', with: nearest
      fill_in 'post_content', with: content
      click_button '投稿する'
    }.to change { Post.count }.by(1)
    expect(page).to have_content '自分とフォロー中のユーザーの投稿'
    expect(page).to have_content shop_name and nearest and content
    # 投稿を削除する
    # expect(page).to have_css '.post_menu'
    # first_post = @user.posts.paginate(page: 1).first
    # expect {
    # delete post_path(first_post)
    # }.to change { Post.count }.by(-1)
  end
end
