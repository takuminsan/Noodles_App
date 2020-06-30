class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10).recent
    else
      @feed_items = Post.all.paginate(page: params[:page], per_page: 10).recent
    end
  end
end
