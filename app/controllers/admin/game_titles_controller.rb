class Admin::GameTitlesController < ApplicationController
  before_action :authenticate_admin!

  # ゲームタイトル一覧ページの表示
  def index
  	@game_title = GameTitle.new # ゲームタイトル新規作成の為
  	@game_titles = GameTitle.all.order("id DESC").page(params[:page]).per(10)
    # 降順 order("カラム名 DESC"), 昇順 order("カラム名 ABC")
  end

  # ゲームタイトル詳細ページの表示
  def show
  	@game_title = GameTitle.find(params[:id])
  end

  # ゲームタイトル新規作成
  def create
  	@game_title = GameTitle.new(game_title_params)
  	if @game_title.save
  	  redirect_to admin_game_title_path(@game_title.id)
  	else
  	  @game_titles = GameTitle.all.page(params[:page]).per(10)
  	  render :index
  	end
  end

  # ゲームタイトル編集ページの表示
  def edit
  	@game_title = GameTitle.find(params[:id])
  end

  # ゲームタイトル情報の更新
  def update
  	@game_title = GameTitle.find(params[:id])
  	if @game_title.update(game_title_params)
  	  redirect_to admin_game_title_path(@game_title.id)
  	else
  	  render :edit
  	end
  end

  private
  def game_title_params
  	params.require(:game_title).permit(:genre_id, :name, :game_image, :introduction)
  end
end
