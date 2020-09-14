class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  # 管理者用トップページの表示
  def top
  end
end
