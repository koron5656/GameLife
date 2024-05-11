class PostsController < ApplicationController
  def new
    @post = Post.new
  end

    # 投稿データの保存
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all

    @q = Post.ransack(params[:q])
    if params[:q].present?
      @posts = @q.result(distinct: true)
    else
      @posts = Post.all
    end

  end

  def show
  end

  # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:comments, :image, :posted_text, :title)
  end
end
