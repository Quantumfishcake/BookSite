Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :authors
  root 'books#index'
end
