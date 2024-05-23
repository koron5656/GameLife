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
    @tags = Post.tag_counts_on(:tags).most_used(20)    # タグ一覧表示
    @q = Post.ransack(params[:q])

    if params[:q].present?
      @posts = @q.result(distinct: true)
    end

    if params[:tag_name].present?
      @posts = @posts.tagged_with(params[:tag_name])
    end
  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tag_counts_on(:tags)    # 投稿に紐付くタグの表示
    @post_comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/posts"
  end

  # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:comments, :image, :posted_text, :title, :tag_list)
  end
end
