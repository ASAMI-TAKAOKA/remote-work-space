class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @posts = user.posts
  end
end