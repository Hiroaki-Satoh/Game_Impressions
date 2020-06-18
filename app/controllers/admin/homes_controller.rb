class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  # トップページの表示
  def top
  end

end
