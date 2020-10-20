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
      flash.now[:danger] = "コメントに失敗しました。"
      @post = Post.find(params[:id])
      @user = @post.user
      @comments = @post.comments
      render 'posts/show'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "コメントが削除されました。"
    redirect_back(fallback_location: root_path)
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
