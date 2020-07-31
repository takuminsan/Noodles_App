class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper # どのコントローラでもセッション用ヘルパーを使えるようにする

  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless logged_in? # ログインしていなければ処理を実行
        store_location  # アクセスしようとしたURLを記憶 (GETリクエストのみ)
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end
end
