class HomesController < ApplicationController

  # トップページの表示
  def top
  	@impressions = Impression.all.order("id DESC").page(params[:page]).per(10)
  end

  # アバウトページの表示
  def about
  end

end
