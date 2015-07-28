Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'nodes#index', as: :user_root
  end
  # root to: ???
  resources :nodes, except: [:show]
  resources :plist, only: :show
end
