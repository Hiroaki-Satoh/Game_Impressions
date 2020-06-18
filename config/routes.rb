Rails.application.routes.draw do

  root 'homes#top'
  get 'homes/about'

  # devise:admin
  devise_for :admins, controllers: {
  	sessions:      'admins/sessions',
  	passwords:     'admins/passwords',
  	registrations: 'admins/registrations'
  }

  # devise:user
  devise_for :users, controllers: {
    sessions:      'users/sessions',
  	passwords:     'users/passwords',
  	registrations: 'users/registrations'
  }

  # 管理者に関するルーティング設定
  namespace :admin do
  	get 'top' => 'homes#top'
  end

  # ユーザに関するルーティング設定
end
