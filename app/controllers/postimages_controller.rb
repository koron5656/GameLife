class PostimagesController < ApplicationController
  def new
    @post = Post.new
  end

    # 投稿データの保存
  def create
    @post = Post.new(post_image_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_images_path
  end

  def index
    @post = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/posts"
  end

  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
