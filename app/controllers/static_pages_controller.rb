class StaticPagesController < ApplicationController
  def home
    @section_title = if logged_in?
                       "自分とフォロー中のユーザーの投稿"
                     else
                       "全てのユーザーの投稿"
                     end

    @feed_items =    if logged_in?
                       current_user.feed.paginate(page: params[:page], per_page: 12).recent
                     else
                       Post.all.paginate(page: params[:page], per_page: 12).recent
                     end

    @genres = Genre.all
  end
end
