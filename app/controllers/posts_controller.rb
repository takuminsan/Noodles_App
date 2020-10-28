class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: [:destroy, :update]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました！"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "投稿が編集されました。"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy # before_actionで@post定義済み
    flash[:success] = "投稿が削除されました。"
    redirect_to root_url
  end

  def search
    @section_title = "「#{params[:search]}」の検索結果"
    @posts = if params[:search].present?
               Post.where(['shop_name LIKE ? OR nearest LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%"])
                   .paginate(page: params[:page], per_page: 12).recent
             else
               Post.none
             end
  end

  def genre
    @genre = Genre.find(params[:genre_id])
    @genres = Genre.all
    @section_title = "「#{@genre.name}」に関する投稿 (全てのユーザー)"
    @posts = @genre.posts.paginate(page: params[:page], per_page: 12).recent
  end

  private

    def post_params
      params.require(:post).permit(:picture, :shop_name, :nearest, :content, genre_ids: [])
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id]) # 他のユーザーのポストを削除させないように、関連付けを使ってポストを見つけている
      redirect_to root_url if @post.nil?
    end
end
