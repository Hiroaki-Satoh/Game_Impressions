Rails.application.routes.draw do

  root 'homes#top'  # サイトトップページの表示
  get 'homes/about' # アバウトページの表示

  # devise:admins
  devise_for :admins, controllers: {
  	sessions:      'admins/sessions',
  	passwords:     'admins/passwords',
  	# registrations: 'admins/registrations'
  }

  # devise:users
  devise_for :users, controllers: {
    sessions:      'users/sessions',
  	passwords:     'users/passwords',
  	registrations: 'users/registrations'
  }

  # 管理者に関するルーティング設定 /admin/xxxx
  namespace :admin do
  	get 'top' => 'homes#top' # 管理者トップページの表示
  	resources :genres,      only: [:index, :show, :create, :update, :edit]
  	resources :game_titles, only: [:index, :show, :create, :update, :edit]
  	resources :users,       only: [:index, :show, :update, :edit]
  	resources :impressions, only: [:index, :show, :destroy]
  end

  # ユーザに関するルーティング設定 /user/xxxx
  namespace :user do
  	resources :genres,      only: [:index]
  	resources :game_titles, only: [:index, :show]
  	resources :users,       only: [:index, :show, :update, :edit]
  	resources :impressions
  end
end
