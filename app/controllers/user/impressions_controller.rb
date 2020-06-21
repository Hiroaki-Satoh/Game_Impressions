class User::ImpressionsController < ApplicationController
  before_action :authenticate_user!, expect: [:index, :show]
  before_action :set_user, expext: [:index, :show]

  def new
  	@impression = Impression.new
  end

  def index
  	# 降順で1ページにつき10個表示する
  	@impressions = Impression.all.order("id DESC").page(params[:page]).per(10)
  end

  def show
  	@impression = Impression.find(params[:id])
  end

  def create
  	@impression = Impression.new(impression_params)
  	@impression.user.id = current_user
  	if @impression.save
  	  flash[:success] = "投稿しました！"
  	  redirect_to user_impression_path(@impression.id) # 作成した感想の詳細ページへ
  	else
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

  private
  def set_user
  	@user = current_user
  end

  def impression_params
  	params.require(:impression).permit(:game_title_id, :image, :title, :body)
  end
end
