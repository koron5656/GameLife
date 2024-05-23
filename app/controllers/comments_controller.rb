class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # @post = Post.find(params[:id])
    @comment = current_user.comments.new(post_comment_params)
    @comment.post_id = @post.id
    if @comment.save!
      redirect_to post_path(@post)
    else
      @posts = Post.all    #この記述を追加      render :index
    end
  end

  def show
    @post = PostImage.find(params[:id])
    @comment = PostComment.new
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:comment).permit(:comment)
  end
end
