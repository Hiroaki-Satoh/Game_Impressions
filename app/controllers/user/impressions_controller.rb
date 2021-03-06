class User::ImpressionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user

  def new
  	@impression = Impression.new
  	@game_titles = GameTitle.all
  end

  def index
  	# 降順で1ページにつき10個表示する
  	@impressions = Impression.all.order("id DESC").page(params[:page]).per(10)
  end

  def show
  	@impression = Impression.find(params[:id])
    # コメント機能
    @comment = Comment.new
    @comments = @impression.comments
  end

  def create
  	@impression = Impression.new(impression_params)
  	@impression.user_id = current_user.id
  	if @impression.save
  	  flash[:success] = "投稿しました！"
  	  redirect_to user_impression_path(@impression.id) # 作成した感想の詳細ページへ
  	else
  	  @impression = Impression.new
  	  @game_titles = GameTitle.all
  	  render :new # 新規作成ページへ
  	end
  end

  def edit
  	@impression = Impression.find(params[:id])
  end

  def update
  	@impression = Impression.find(params[:id])
  	if @impression.update(impression_params)
  	  redirect_to user_impression_path(@impression.id) # 変更したゲームタイトル詳細ページへ
  	else
  	  render :edit # 編集ページへ
  	end
  end

  def destroy
    @impression = Impression.find(params[:id])
  	@impression.destroy
  	flash[:notice] = "削除しました"
  	redirect_to user_user_path(@user) # マイページへ
  end

  private
  def set_user
  	@user = current_user
  end

  def impression_params
  	params.require(:impression).permit(:game_title_id, :image, :title, :body)
  end
end
