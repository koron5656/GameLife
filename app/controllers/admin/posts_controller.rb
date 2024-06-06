class Admin::PostsController < ApplicationController
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/admin/dashboards"
  end
end
