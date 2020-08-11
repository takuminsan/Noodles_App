require 'rails_helper'

describe 'いいね機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
    log_in_as(@user)
  end

  it '食べたい！ボタンが正常に動作すること' do
    # ボタンを押す
    click_on '「食べたい！」'
    wait_for_ajax(5) # spec/supports/test_helper.rb
    expect(@user.likes.count).to eq 1
    expect(@post.likes.count).to eq 1
    expect(page).to have_content 'あなたと0人が「食べたい！」'
    # 「食べたい！」ページに食べたい！ボタンを押した投稿が表示されること
    visit likes_user_path(@user)
    expect(page).to have_content 'Noodles-01'
    # ボタンを押して食べたい！を解除
    click_on 'あなたと0人が「食べたい！」'
    wait_for_ajax(5) # spec/supports/test_helper.rb
    expect(@user.likes.count).to eq 0
    expect(@post.likes.count).to eq 0
  end
end
