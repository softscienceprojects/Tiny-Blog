Rails.application.routes.draw do
  get 'admin/dashboard'
  get 'admin/stats'
  get 'admin/settings'
  resources :categories
  resources :comments
  resources :posts
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'posts#index'
  get '/about', to: 'static#about'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'


end
