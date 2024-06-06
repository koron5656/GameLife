class UsersController < ApplicationController
  # before_action :authenticate_admin!

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
  # end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
    # @post = @user.post_images.page(params[:page])

    @favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_list = Post.find(@favorites)

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      @post = @user.posts
      render:edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end

end