class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :search]

  def index
    @posts = Post.page(params[:page]).per(3).includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿に成功しました!"
      redirect_to posts_path
    else
      flash.now[:danger] = "投稿失敗。※[スポット名称] [住所] [私のイチオシポイント]を入力してください。"
      render 'posts/new'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    @likes_count = Like.where(post_id: @post.id).count #カウントメソッド
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private
  def post_params
    params.require(:post).permit(:image, :text, :body, :address, :lat, :lng).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
      flash[:danger] = "※※※ 新規登録/ログインが必要です ※※※"
      redirect_to action: :index unless user_signed_in?
  end
end