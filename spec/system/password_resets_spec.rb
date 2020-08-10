require 'rails_helper'

describe 'パスワードリセット', type: :system do
  before do
    ActionMailer::Base.deliveries.clear
    @user = FactoryBot.create(:user)
  end

  it 'パスワード再設定メールが送られること' do
    visit new_password_reset_path
    # メールアドレスが無効
    fill_in 'password_reset_email', with: ''
    click_button '送信'
    expect(page).to have_content 'メールアドレスがみつかりません。'
    # メールアドレスが有効
    fill_in 'password_reset_email', with: 'test1@example.com'
    click_button '送信'
    expect(ActionMailer::Base.deliveries.size).to eq (1)
    expect(page).to have_content 'パスワード再設定用のリンクを記載したメールを送信しました。'
  end

  #it 'パスワード再設定フォームが機能すること' do
  #  post password_resets_path, params: { password_reset: { email: @user.email } }
  #  user = controller.instance_variable_get('@user')
  #  visit edit_password_reset_path(user.reset_token, email: "" )
  #  expect(response).to redirect_to root_path
  #end
end
