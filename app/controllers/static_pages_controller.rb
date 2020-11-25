class StaticPagesController < ApplicationController
  def home
    @section_title = if logged_in?
                       "自分とフォロー中のユーザーの投稿"
                     else
                       "全てのユーザーの投稿"
                     end

    @feed_items =    if logged_in?
                       if params[:sort]
                         current_user.feed.paginate(page: params[:page], per_page: 12).order(params[:sort])
                       else
                         current_user.feed.paginate(page: params[:page], per_page: 12).recent
                       end
                     else
                       if params[:sort]
                         Post.all.paginate(page: params[:page], per_page: 12).order(params[:sort])
                       else
                         Post.all.paginate(page: params[:page], per_page: 12).recent
                       end
                     end

    @genres = Genre.all
  end
end
