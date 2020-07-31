class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email]) # 有効化URLのクエリパラメータに設定されたemailを受け取り、ユーザーを検索
    # ユーザーが存在し、有効化されておらず、有効化URLから受け取ったactivation_tokenとユーザーのactivation_digestを照合
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate # 有効化するメソッド (activated: true, activated_at: Time.zone.now)
      log_in user
      flash[:success] = "アカウントが有効化されました！"
      redirect_to root_url
    else
      flash[:danger] = "無効なリンクです。"
      redirect_to root_url
    end
  end
end
