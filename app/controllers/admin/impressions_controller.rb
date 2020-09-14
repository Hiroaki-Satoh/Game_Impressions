class Admin::ImpressionsController < ApplicationController
  before_action :authenticate_admin!

  # 投稿一覧ページの表示
  def index
  	@impressions = Impression.all.order("id DESC").page(params[:page]).per(10)
  end

  # 投稿詳細ページの表示
  def show
  	@impression = Impression.find(params[:id])
    @comment = Comment.new # コメントの新規作成の為
    @comments = @impression.comments # コメントの一覧表示の為
  end

  # 投稿のの削除
  def destroy
    @impression = Impression.find(params[:id])
  	@impression.destroy
  	flash[:notice] = "削除しました"
  	redirect_to admin_impressions_path # 投稿一覧へ
  end
end
