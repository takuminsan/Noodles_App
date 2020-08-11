require 'rails_helper'

describe '投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it '投稿一連のテスト' do
    # 無効な投稿
    log_in_as(@user)
    visit new_post_path
    fill_in 'post_shop_name', with: ''
    fill_in 'post_nearest', with: ''
    fill_in 'post_content', with: ''
    click_button '投稿する'
    expect(page).to have_css '#error_explanation'
    # 有効な送信
    expect {
      fill_in 'post_shop_name', with: "ラーメンNoodle"
      fill_in 'post_nearest', with: "新宿駅"
      fill_in 'post_content', with: "美味しいね"
      click_button '投稿する'
    }.to change { Post.count }.by(1)
    expect(page).to have_content '自分とフォロー中のユーザーの投稿'
    expect(page).to have_content "ラーメンNoodle" and "新宿駅" and "美味しいね"
    # 投稿を編集する
    expect(page).to have_css '.post_menu'
    find(".fa-pencil-alt").click
    # テキストボックスに値が入っていることの確認
    expect(page).to have_field '店舗名', with: 'ラーメンNoodle'
    expect(page).to have_field '最寄駅', with: '新宿駅'
    expect(page).to have_field '説明文', with: '美味しいね'
    fill_in 'post_shop_name', with: "中華そばnoodles"
    fill_in 'post_nearest', with: "八王子駅"
    fill_in 'post_content', with: "不味いね"
    click_button '編集する'
    expect(page).to have_content "中華そばnoodles" and "八王子駅" and "不味いね"
    # 投稿を削除する
    expect(page).to have_css '.post_menu'
    expect {
      find(".fa-trash-alt").click
      page.accept_confirm "本当に削除しますか？"
      expect(page).to have_content "投稿が削除されました。"
    }.to change { Post.count }.by(-1)
  end
end
