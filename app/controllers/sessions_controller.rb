class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_url
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)               # 送信されたメールアドレスを使って、データベースからユーザーを取り出す
    if user && user.authenticate(params[:session][:password])                   # ユーザーがデータベースにあり、かつ、認証に成功した場合
      if user.activated?                                                        # ユーザーが有効化済みの場合
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)   # 「ログイン状態保持」にチェックがあれば、remember_digestにランダムなトークンを保存し、cookiesにuser_idとremember_tokenを保存
        redirect_back_or root_path
      else
        message  = "アカウントが有効ではありません。 "
        message += "アカウント有効化のメールを確認してください。"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'メールアドレスorパスワードが無効です。'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in? # ログイン中の場合にのみログアウトさせることで、複数タブでログアウトを実施した際のバグを回避
    redirect_to root_url
  end
end
