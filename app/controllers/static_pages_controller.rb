class StaticPagesController < ApplicationController
  def home
    @feed_items = if logged_in?
                    current_user.feed.paginate(page: params[:page], per_page: 10).recent
                  else
                    Post.all.paginate(page: params[:page], per_page: 10).recent
                  end
  end
end
