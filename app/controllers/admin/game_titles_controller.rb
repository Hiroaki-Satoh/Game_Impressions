class Admin::GameTitlesController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@game_title = GameTitle.new
  	# 降順で1ページにつき10個表示させる。
  	@game_titles = GameTitle.all.page(params[:page]).per(10)
  end

  def show
  	@game_title = GameTitle.find(params[:id])
  end

  def create
  	@game_title = GameTitle.new(game_title_params)
  	if @game_title.save
  	  redirect_to admin_game_title_path(@game_title.id) # 作成したゲームタイトル詳細ページへ
  	else
  	  @game_titles = GameTitle.all.page(params[:page]).per(10)
  	  render :index # 新規作成&一覧ページへ
  	end
  end

  def edit
  	@game_title = GameTitle.find(params[:id])
  end

  def update
  	@game_title = GameTitle.find(params[:id])
  	if @game_title.update(game_title_params)
  	  redirect_to admin_game_title_path(@game_title.id) # 変更したゲームタイトル詳細ページへ
  	else
  	  render :edit # 編集ページへ
  	end
  end

  private
  def game_title_params
  	params.require(:game_title).permit(:genre_id, :name, :game_image, :introduction)
  end
end
