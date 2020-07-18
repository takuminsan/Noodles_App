require 'rails_helper'

describe 'ユーザー登録機能', type: :system do
  context 'フォーム入力情報が不足しているとき' do
    it 'ユーザー登録に失敗する' do
      visit signup_path # ユーザー登録ページにアクセス
      expect{
        fill_in 'user_name', with: '' # id: user_nameというtext_fieldに''を入力
        fill_in 'user_email', with: 'user@invalid' # id: user_emailというtext_fieldに'user@invalid'を入力
        fill_in 'user_password', with: 'password' # id: user_passwordというtext_fieldに'password'を入力
        fill_in 'user_password_confirmation', with: 'password' # id: user_password_confirmationというtext_fieldに'password'を入力
        click_button 'アカウント作成' # 'アカウント作成'ボタンを押す
      }.not_to change{User.count} # 無効な情報を入力した際にUserオブジェクトの数は変わらない
      expect(page).to have_content 'エラーがあります。'
    end
  end
  context 'フォーム入力情報が有効であるとき' do
    it 'ユーザー登録に成功する' do
      visit signup_path
      expect{
        fill_in 'user_name', with: 'test_user'
        fill_in 'user_email', with: 'test_user@valid.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button 'アカウント作成'
      }.to change{User.count}.by(1)
    end
    #test "valid signup information with account activation" do
    #  assert_difference 'User.count', 1 do
    #    post users_path, params: { user: { name: "Example User",
    #                                       email: "user@example.com",
    #                                       password: "password",
    #                                       password_confirmation: "password" } }
    #  end
    #  assert_equal 1, ActionMailer::Base.deliveries.size
    #  user = assigns(:user)
    #  assert_not user.activated?
    #  # 有効化していない状態でログインしてみる
    #  log_in_as(user)
    #  assert_not is_logged_in?
    #  # 有効化トークンが不正な場合
    #  get edit_account_activation_path("invalid token", email: user.email)
    #  assert_not is_logged_in?
    #  # トークンは正しいがメールアドレスが無効な場合
    #  get edit_account_activation_path(user.activation_token, email: 'wrong')
    #  assert_not is_logged_in?
    #  # 有効化トークンが正しい場合
    #  get edit_account_activation_path(user.activation_token, email: user.email)
    #  assert user.reload.activated?
    #  follow_redirect!
    #  assert_template '/'
    #  assert is_logged_in?
  end
end
