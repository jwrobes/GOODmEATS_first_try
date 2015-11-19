Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :restaurants
  resources :add_restaurants
  get '/ajax/get_source_meats/', to: 'ajax#get_source_meats'

end
