class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@genre = Genre.new
  	@genres = Genre.all.page(params[:page]).per(10)
  end

  def show
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  	  flash[:notice] = "ジャンルを追加しました"
  	  redirect_to admin_genres_path # 一覧＆新規作成ページへ
  	else
  	  @genres = Genre.all.page(params[:page]).per(10)
  	  render :index # 一覧＆新規作成ページに戻る
  	end
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	if @genre.update(genre_params)
  	  flash[:success] = "変更を保存しました！"
  	  redirect_to admin_genres_path # 一覧＆新規作成ページへ
  	else
  	  render :edit # 編集ページに戻る
    end
  end

  private
  def genre_params
  	params.require(:genre).permit(:name, :is_valid)
  end
end
