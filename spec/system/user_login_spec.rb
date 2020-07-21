require 'rails_helper'

describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it '有効な情報でなければログインできないこと' do
    visit login_path
    expect(page).to have_content 'ログイン'
    fill_in 'session_email', with: ''
    fill_in 'session_password', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content 'メールアドレスorパスワードが無効です。'
  end

  it '有効な情報でログインできること' do
    visit login_path
    fill_in 'session_email', with: @user.email
    fill_in 'session_password', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content @user.name
    expect(page).not_to have_selector 'li', text: ' ログイン'
    expect(page).to have_content '投稿する'
  end
end

#    delete logout_path
#    assert_not is_logged_in?
#    assert_redirected_to root_url
#    # 2番目のウィンドウでログアウトをクリックするユーザーをシミュレートする
#    delete logout_path
#    follow_redirect!
#    assert_select "a[href=?]", login_path
#    assert_select "a[href=?]", logout_path,      count: 0
###    assert_select "a[href=?]", user_path(@user), count: 0
#  end
##
#  test "login with remembering" do
#    log_in_as(@user, remember_me: '1')
#    assert_not_empty cookies['remember_token']
#  end
#
#  test "login without remembering" do
#    # クッキーを保存してログイン
#    log_in_as(@user, remember_me: '1')
#    delete logout_path
#    # クッキーを削除してログイン
#    log_in_as(@user, remember_me: '0')
#    assert_empty cookies['remember_token']
#  end
#
#  test "login as test-user" do
#    get root_path
#    post login_path, params: { session: { email: 'test@test-user.com',
#                                          password: 'password' } }
#    assert is_logged_in?
#    assert_redirected_to root_path
#    follow_redirect!
#    assert_template '/'
#  end
#end
##
