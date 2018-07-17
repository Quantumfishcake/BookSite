Rails.application.routes.draw do
  get 'chains/new'
  devise_for :users
  resources :books
  resources :authors
  resources :chains

  root 'nyt_best_selling#index'
end
