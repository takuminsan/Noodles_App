class MapsController < ApplicationController
  before_action :logged_in_user, only: [:index, :map]

  def index
  end

  def map
    if params[:posts] == "current_user"
      @posts = current_user.posts.to_json.html_safe
    elsif params[:posts] == "following"
      @posts = current_user.feed.to_json.html_safe
    end
    respond_to do |format|
      format.js { @posts }
    end
  end
end
