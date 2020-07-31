class ApplicationMailer < ActionMailer::Base
  default from: "noreply@example.com"
  layout 'mailer' # メールのフォーマットに対応するメイラーレイアウト
end
