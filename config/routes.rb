Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create, :update, :destroy]
  resources :ideas
  resources :sessions, only: :new

  namespace :admin do
    resources :categories
    resources :images
    resources :users
    resources :ideas
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root to: "users#new"
end
