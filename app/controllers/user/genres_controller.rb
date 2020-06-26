class User::GenresController < ApplicationController

  def index
  	@genres = Genre.all
  	@user = current_user
  end
end
