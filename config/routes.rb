Rails.application.routes.draw do
  get 'chains/new'
  get 'nyt_best_selling/random' => 'nyt_best_selling#random'
  get 'books/mybooks' => 'books#mybooks'
  post '/search/books' => 'nyt_best_selling#search'
  post '/create/books' => 'nyt_best_selling#create'
  devise_for :users
  resources :books
  resources :authors
  resources :chains
  resources :nyt_best_selling
  root 'nyt_best_selling#random'
end
