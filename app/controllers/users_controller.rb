class UsersController < ApplicationController
  before_action :move_to_index

  def follows
    user = User.find(params[:id])
    @users = user.following_user.page(params[:page]).per(3).reverse_order
  end
  
  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end

  def index
    @users = User.page(params[:page]).per(3).reverse_order
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
    @nickname = @user.nickname
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  private

    def user_params
      params.require(:user).permit(:nickname, :email, :password,
                                   :password_confirmation)
    end


    def move_to_index
      redirect_to request.referer unless user_signed_in?
    end

    # 正しいユーザーかどうかを確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうかを確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end