Rails.application.routes.draw do
  devise_for :users
  resources :user_stocks, only:[:create, :destroy]
  resources :friendships
  root "homepage#index"
  get 'portfolio', to: 'users#portfolio'
  get 'friends', to: 'friendships#index'
  get 'stock_search', to: 'stocks#search'
end
