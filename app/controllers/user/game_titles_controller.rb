class User::GameTitlesController < ApplicationController

  def index
  	# 降順で1ページにつき9個表示させる。
  	@game_titles = GameTitle.all.order("id DESC").page(params[:page]).per(9)
  end

  def show
  	@game_title = GameTitle.find(params[:id])
  end
end
