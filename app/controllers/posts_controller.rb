class PostsController < ApplicationController
  # ログインしていなくても入れるアクション名↓↓
  before_action :authenticate, except: [:index, :show]

  before_action :validates_new, only: :create

  def authenticate
    # ログインしていないとログイン画面に飛ばす記述
    redirect_to new_user_session_path() unless user_signed_in?
  end

  def index
    # 全ての作品情報の取得
    @works = Work.all
  end

  def new
    # どの作品にコメントするか
    @work = Work.find(params[:format])
    # 新しいインスタンスの作成
    @post = Post.new
    # ユーザー登録情報の取得
    @user = current_user
  end
  
  def validates_new
    @work = Work.find(params[:post][:work_id])
    @post = Post.new(
      title: post_params[:title],
      rate: post_params[:rate],
      content: post_params[:content],
      work_id: post_params[:work_id],
      user_id: post_params[:user_id]
    )
    render new_post_path() unless @post.valid?
  end

  def create
    # 入力したparamsをストロングパラメーターに代入し新しいインスタンス内に代入
    @post = Post.new(post_params)
    # ポストがsaveできれば作品show画面へ
    if @post.save
      redirect_to post_path(@post.work_id)
    else
      # saveできなければトップ画面へ
      render ''
    end
  end

  def show
    # トップ画面で選択された作品情報の取得
    @work = Work.find(params[:id])
    # Post内のwork_idが選択されたwork.idと同一のpostを@postsに代入
    @posts = Post.where(work_id: @work.id)
    # 役に立ったボタンが押された時に生成されるようにインスタンス作成
    @like = Like.new
  end

  private


  # セキュリティ上の脆弱性対処のためのストロングパラメーター導入
  def post_params
    params.require(:post).permit(
      :title,
      :rate,
      :content,
      :work_id,
    ).merge(user_id: current_user.id)
  end


end
