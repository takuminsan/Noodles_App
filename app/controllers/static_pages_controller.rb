class StaticPagesController < ApplicationController
  def home
    @feed_items = if logged_in?
                    current_user.feed.paginate(page: params[:page], per_page: 12).recent
                  else
                    Post.all.paginate(page: params[:page], per_page: 12).recent
                  end
  end
end
