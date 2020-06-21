class User::GenresController < ApplicationController

  def index
  	@genres = Genre.all.page(params[:page]).per(9)
  end
end
