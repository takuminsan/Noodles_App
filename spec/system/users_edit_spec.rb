require 'rails_helper'

describe 'ユーザー設定', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ユーザー設定の失敗と成功' do
    log_in_as(@user)
    # 失敗
    visit edit_user_path(@user)
    fill_in 'user_name', with: ''
    fill_in 'user_email', with: 'foo@invalid'
    fill_in 'user_password', with: 'foo'
    fill_in 'user_password_confirmation', with: 'bar'
    click_button '変更を保存'
    expect(page).to have_css '#error_explanation'
    # 成功
    name  = "Foo Bar"
    email = "foo@bar.com"
    fill_in 'user_name', with: name
    fill_in 'user_email', with: email
    fill_in 'user_password', with: ''
    fill_in 'user_password_confirmation', with: ''
    click_button '変更を保存'
    expect(page).to have_content 'アカウント情報が変更されました'
    @user.reload
    expect(@user.name).to eq name
    expect(@user.email).to eq email
  end
end
