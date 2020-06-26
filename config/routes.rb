Rails.application.routes.draw do
  devise_for :users
  resources :user_stocks, only:[:create, :destroy]
  root "homepage#index"
  get 'portfolio', to: 'users#portfolio'
  get 'stock_search', to: 'stocks#search'
end
