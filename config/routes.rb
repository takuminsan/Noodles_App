Rails.application.routes.draw do
#ホーム
  root 'static_pages#home'
#ユーザー登録
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
#ログイン・ログアウト
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
#ユーザーページ
  resources :users do
    member do
      get :following, :followers, :likes
    end
  end
#アカウントの有効化
  resources :account_activations, only: [:edit]
#パスワードのリセット
  resources :password_resets,     only: [:new, :create, :edit, :update]
#投稿
  resources :posts,               only: [:new, :create, :edit, :show, :update, :destroy]
  post '/posts/new', to: 'posts#create'
  patch '/posts/:id/edit', to: 'posts#update'
#フォロー
  resources :relationships,       only: [:create, :destroy]
#食べたい！（いいね機能）
  resources :likes, only: [:create, :destroy]
#google-map
  resources :maps, only: [:index]
  get '/map_request', to: 'maps#map', as: 'map_request'
end
