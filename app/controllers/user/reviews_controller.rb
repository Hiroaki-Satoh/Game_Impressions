class User::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
  	@game_title = GameTitle.find(params[:game_title_id])
  	@review = current_user.reviews.new(review_params)
  	@review.game_title_id = @game_title.id
  	if @review.save
  	  flash[:success] = "レビューを投稿しました！"
  	  redirect_back(fallback_location: root_url) # 1つ前のURL（game_title詳細）へ
  	else
      flash[:alert] = "投稿に失敗しました。"
      redirect_back(fallback_location: root_url)
    end
  end

  def edit
  	@review = Review.find(params[:game_title_id])
  end

  def update
  	@review = Review.find(params[:game_title_id])
    binding.pry
  	if @review.update(review_params)
  	  flash[:notice] = "レビューを更新しました！"
  	  redirect_back(fallback_location: root_url) # 1つ前のURL（game_title詳細）へ
  	end
  end

  private
  def review_params
  	params.require(:review).permit(:title, :body, :graphic,
  		                            :sound, :story, :volume, :recommended)
  end
end
