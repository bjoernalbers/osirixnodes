Rails.application.routes.draw do
  devise_for :users
  get 'pages/index'
  authenticated :user do
    root to: 'nodes#index', as: :user_root
  end
  root to: 'pages#index'
  resources :nodes
  resources :plist, only: :show
end
