class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!,{ except: [:top, :about] }

  protected
  # ログイン（sign_in）後の画面遷移先の変更
  def after_sign_in_path_for(resource)
    if admin_signed_in?
      admin_top_path # 管理者用トップページへ
    else
      root_path # とりあえずトップ画面へ
    end
  end

  # ユーザ登録（sign_up）後の画面遷移先の変更
  def after_sign_up_path_for(resource)
    root_path # とりあえずトップ画面へ
  end

  # ログアウト（sign_out）後の画面遷移先の変更
  def after_sign_out_path_for(resource)
    root_path
  end

  # ユーザ登録（sign_up）の際に、ニックネーム（nickname）のデータ操作を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
