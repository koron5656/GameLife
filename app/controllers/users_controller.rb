class UsersController < ApplicationController
    # before_action :authenticate_admin!

  def show
    @user = User.find(params[:id])
    @post = @user.post_images
    # @post = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end
    # def destroy
    #     @user = User.find(params[:id])
    #     @user.destroy
    #     redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
    # end
end