require 'rails_helper'

describe 'いいね機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
    log_in_as(@user)
  end

  it '食べたい！ボタンを押して食べたい！一覧に投稿が表示されること' do
    # ボタンを押す
    click_on '0人が「食べたい！」'
    # 「食べたい！」ページに食べたい！ボタンを押した投稿が表示されること
    visit likes_user_path(@user)
    expect(page).to have_content 'Noodles-01'
    expect(@user.reload.likes.count).to eq 1
    expect(@post.reload.likes.count).to eq 1
    expect(page).to have_content 'あなたと0人が「食べたい！」'
    # ボタンを押して食べたい！を解除
    click_on 'あなたと0人が「食べたい！」'
    visit likes_user_path(@user)
    expect(page).not_to have_content 'Noodles-01'
    expect(@user.reload.likes.count).to eq 0
    expect(@post.reload.likes.count).to eq 0
  end
end
