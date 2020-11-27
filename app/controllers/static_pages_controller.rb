class StaticPagesController < ApplicationController
  # セレクトボックスで許可する属性を指定
  ALLOWED_ATTRIBUTES = ["created_at desc", "created_at asc", "rate desc", "rate asc"].freeze

  def home
    @section_title = logged_in? ? "自分とフォロー中のユーザーの投稿" : "全てのユーザーの投稿"
    @feed_items = if logged_in? && params[:sort].present? # リファクタリングしたい
                    validate_order_by(params[:sort])
                    current_user.feed.paginate(page: params[:page], per_page: 12).order(params[:sort])
                  elsif logged_in? && params[:sort].nil?
                    current_user.feed.paginate(page: params[:page], per_page: 12).recent
                  elsif params[:sort].present?
                    validate_order_by(params[:sort])
                    Post.all.paginate(page: params[:page], per_page: 12).order(params[:sort])
                  else
                    Post.all.paginate(page: params[:page], per_page: 12).recent
                  end
    @selected_sort = params[:sort]
    @genres = Genre.all
  end

  private

    # params[:sort]で受け取った値に対してバリデーション
    # 事前に定めた属性名以外はエラーとする
    def validate_order_by(text)
      raise ArgumentError, "Attribute not allowed: #{text}" unless text.in?(ALLOWED_ATTRIBUTES)
    end
end
