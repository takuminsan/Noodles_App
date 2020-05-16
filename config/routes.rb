Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers, :likes
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts,               only: [:new, :create, :edit, :update, :destroy]
  resources :relationships,       only: [:create, :destroy]
  post '/posts/new', to: 'posts#create'
  patch '/posts/:id/edit', to: 'posts#update'
  resources :likes, only: [:create, :destroy]
end
