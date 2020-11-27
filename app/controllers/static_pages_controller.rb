class StaticPagesController < ApplicationController
  def home
    @section_title = logged_in? ? "自分とフォロー中のユーザーの投稿" : "全てのユーザーの投稿"
    @feed_items = if logged_in? && params[:sort].present? # リファクタリングしたい
                    current_user.feed.paginate(page: params[:page], per_page: 12).order(params[:sort])
                  elsif logged_in? && params[:sort].nil?
                    current_user.feed.paginate(page: params[:page], per_page: 12).recent
                  elsif params[:sort].present?
                    Post.all.paginate(page: params[:page], per_page: 12).order(params[:sort])
                  else
                    Post.all.paginate(page: params[:page], per_page: 12).recent
                  end
    @selected_sort = params[:sort]
    @genres = Genre.all
  end
end
