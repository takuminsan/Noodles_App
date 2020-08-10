# 指定したユーザーでログイン
def log_in_as(user)
  visit login_path
  fill_in 'session_email', with: user.email
  fill_in 'session_password', with: 'password'
  click_button 'ログイン'
end

# メール本文からアカウント有効化のURLを抽出 (うまくテストできないので保留)
# def extract_confirmation_url(mail)
# body = mail.text_part.body.encoded
# body[/http[^"]+/]
# end
