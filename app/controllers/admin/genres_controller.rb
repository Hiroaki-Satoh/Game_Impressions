class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  # ジャンルの一覧ページの表示
  def index
  	@genre = Genre.new # ジャンルの新規登録の為
  	@genres = Genre.all.page(params[:page]).per(10)
  end

  def show
  end

  # ジャンルの新規作成
  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  	  flash[:notice] = "ジャンルを追加しました"
  	  redirect_to admin_genres_path
  	else
  	  @genres = Genre.all.page(params[:page]).per(10)
  	  render :index
  	end
  end

  # ジャンルの編集ページの表示
  def edit
  	@genre = Genre.find(params[:id])
  end

  # 登録情報の変更
  def update
  	@genre = Genre.find(params[:id])
  	if @genre.update(genre_params)
  	  flash[:success] = "変更を保存しました！"
  	  redirect_to admin_genres_path
  	else
  	  render :edit
    end
  end

  private
  def genre_params
  	params.require(:genre).permit(:name, :is_valid)
  end
end
