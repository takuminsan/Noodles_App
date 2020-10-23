class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @post = Post.find(params[:id])
    if @comment.save
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js
      end
    else
      # Ajaxでエラーメッセージを表示できるようになったら改善予定
      flash[:danger] = "コメントに失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post = Post.find(@comment.post_id)
    @comment.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
