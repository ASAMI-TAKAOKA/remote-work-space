class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    if user_signed_in?
      @post  = current_user.posts.build
      @feed_items = current_user.feed
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password,
                                 :password_confirmation)
  end

  # beforeフィルター

  # 正しいユーザーかどうかを確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  
end