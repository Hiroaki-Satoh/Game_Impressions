Rails.application.routes.draw do

  root 'homes#top'
  get 'homes/about'

  # devise:admins
  devise_for :admins, controllers: {
  	sessions:      'admins/sessions',
  	passwords:     'admins/passwords',
  	registrations: 'admins/registrations'
  }

  # devise:users
  devise_for :users, controllers: {
    sessions:      'users/sessions',
  	passwords:     'users/passwords',
  	registrations: 'users/registrations'
  }

  # 管理者に関するルーティング設定 /admin/xxxx
  namespace :admin do
  	get 'top' => 'homes#top'
  	resources :genres,      only: [:index, :show, :create, :update, :edit]
  	resources :game_titles, only: [:index, :show, :creste, :update, :edit]
  end

  # ユーザに関するルーティング設定 /user/xxxx
end
