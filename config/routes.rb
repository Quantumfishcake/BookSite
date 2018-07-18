Rails.application.routes.draw do
  get 'chains/new'
  
  post '/search/books' => 'nyt_best_selling#search'
  post '/create/books' => 'nyt_best_selling#create'
  devise_for :users
  resources :books
  resources :authors
  resources :chains
  resources :nyt_best_selling
  root 'authors#index'
end
