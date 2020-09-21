class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  # 登録ユーザの一覧ページの表示
  def index
  	@users = User.all.order("id DESC").page(params[:page]).per(10)
  end

  # 登録ユーザの詳細ページの表示
  def show
  	@user = User.find(params[:id])
  end

  # 登録ユーザ情報の編集ページの表示
  def edit
  	@user = User.find(params[:id])
  end

  # 登録ユーザ情報の変更
  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:success] = "ユーザの情報を変更しました。"
  		redirect_to admin_users_path
  	else
  		render :edit
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:nickname, :icon_image, :introduction, :is_valid)
  end
end
