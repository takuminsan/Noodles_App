class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "パスワード再設定用のリンクを記載したメールを送信しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "メールアドレスがみつかりません。"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, :blank) # 入力されたパスワードが空であればエラーメッセージを追加する (passwordはバリデーションでallow: nilしてるので、ここで明示的にキャッチするコードを追加する必要がある)
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      @user.update_attribute(:reset_digest, nil)
      flash[:success] = "パスワードが再設定されました。"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    # Strong Parameters
    # マスアサインメント (ユーザーが送信したデータをまるごとUser.newに渡す)の脆弱性を回避
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    # beforeフィルタ

    # password_resetフォームを描画するために、必要な@userを定義
    def get_user
      @user = User.find_by(email: params[:email])
    end

    # password_resetを行う正しいユーザーかどうか確認する
    def valid_user
      unless (@user && @user.activated? &&
              @user.authenticated?(:reset, params[:id])) # reset_digestとreset_tokenを検証
        redirect_to root_url
      end
    end

    # トークンが期限切れかどうか確認する
    def check_expiration
      if @user.password_reset_expired? # reset_sent_at < 2.hours.agoがtrueの場合
        flash[:danger] = "パスワード再設定の期限が切れています。"
        redirect_to new_password_reset_url
      end
    end
end
