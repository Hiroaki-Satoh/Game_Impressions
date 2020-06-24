# impressionへのいいね機能
class User::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
	@impression = Impression.find(params[:impression_id])
    @like = current_user.likes.new(impression_id: @impression.id)
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @impression = Impression.find(params[:impression_id])
    @like = current_user.likes.find_by(impression_id: @impression.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
