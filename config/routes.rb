Rails.application.routes.draw do
  root to: 'nodes#index'
  resources :nodes, except: [:show]
end
