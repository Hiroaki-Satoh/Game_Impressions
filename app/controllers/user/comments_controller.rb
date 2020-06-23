class User::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @impression = Impression.find(params[:impression_id])
    @comment = @impression.comments.new(comment_params)
    @comment.user_id == current_user.id
    if @comment.save
      flash[:success] = "コメントを投稿しました！"
      redirect_back(fallback_location: root_url) # 1つ前のURL（Impression詳細）へ
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], impression_id: params[:impresison_id])
    if @comment.destroy
      redirect_back(fallback_location: root_url) # 1つ前のURL（Impression詳細）へ
    end
  end

  private
  def comment_params
  	params.require(:comment).permit(:body)
  end
end
