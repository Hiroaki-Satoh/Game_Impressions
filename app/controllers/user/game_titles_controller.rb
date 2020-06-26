class User::GameTitlesController < ApplicationController
  before_action :set_user

  def index
  	# 降順で1ページにつき9個表示させる。
  	@game_titles = GameTitle.all.order("id DESC").page(params[:page]).per(9)
  end

  def show
  	@game_title = GameTitle.find(params[:id])
    # レビュー機能
    @review = Review.new
    @reviews = @game_title.reviews.order("id DESC").page(params[:page]).per(5)
  end

  private
  def set_user
  	@user = current_user
  end
end
