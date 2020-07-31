# メールプレビューの設定
# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.first                       # user変数に開発用データベースの最初のユーザーを代入
    user.activation_token = User.new_token  # userの仮想属性activation_tokenにランダムなトークンを保存
    UserMailer.account_activation(user)     # UserMailerのaccount_activationメソッドを使ってメールを送信
  end

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end
end
