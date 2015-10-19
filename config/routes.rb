Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :restaurants
  resources :add_restaurants
end
