class Admin::ImpressionsController < ApplicationController
  before_action :authenticate_admin!

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

  def destroy
    @impression = Impression.find(params[:id])
  	@impression.destroy
  	flash[:notice] = "削除しました"
  	redirect_to admin_impressions_path # 投稿一覧へ
  end
end
