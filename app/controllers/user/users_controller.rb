class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :baria_user, only: [:update]

  def index
  	# 降順で1ページにつき10個表示する
  	@users = User.all.order("id DESC").page(params[:page]).per(10)
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  	if current_user != @user
      redirect_to user_path(current_user)
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:success] = "変更を保存しました。"
  		redirect_to user_user_path(@user)
  	else
  		render :edit # 編集ページへ
    end
  end

  private
  def user_params
  	params.require(:user).permit(:nickname, :icon_image, :introduction, :is_valid)
  end

  def set_user
  	@user = current_user
  end

  # URL直接指定でのアクセスを禁止
  def baria_user
  	unless params[:id].to_i == current_user.id
  	  redirect_to user_path(current_user)
  	end
  end
end
