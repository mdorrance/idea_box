Rails.application.routes.draw do
  resources :users
  resources :categories
  resources :ideas
  resources :sessions, only: :new

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root to: "users#new"
end
