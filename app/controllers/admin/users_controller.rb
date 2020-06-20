class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	# 降順で1ページにつき10個表示する
  	@users = User.all.order("id DESC").page(params[:page]).per(10)
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:success] = "ユーザの情報を変更しました。"
  		redirect_to admin_users_path # 一覧ページへ
  	else
  		render :edit # 編集ページへ
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:nickname, :icon_image, :introduction, :is_valid)
  end
end
