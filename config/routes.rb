Rails.application.routes.draw do
  devise_for :users
  root "homepage#index"
  get 'portfolio', to: 'users#portfolio'
  get 'stock_search', to: 'stocks#search'
end
